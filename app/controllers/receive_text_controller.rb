# frozen_string_literal: true
class ReceiveTextController < ApplicationController
  def index
    body = params['Body']
    number = params['From']

    body.gsub!(/[^0-9]/, '')
    number.gsub!(/[^0-9]/, '')

    user = User.find_by(phone: number)
    return unless user

    if (1..20).cover? body
      r = user.reservations.last
      makeCall(r.venue, r)
    end
  end

  def used_last
    body = params[:Body]
    from = params[:From]

    from.gsub!(/[^0-9]/, '') unless from.blank?

    unless body.blank?
      body.downcase!

      if body = 'used'
        user = User.find_by(phone: from)
        if !user.blank?
          payment = Payment.where(user_id: user.id).limit(1).order('created_at desc').first
        else
          response = 'Uknown user - is this phone number registered with your FoodCircles profile?'
        end
        if !payment.blank?
          payment.state = 'Used'
          payment.save

          response = 'Voucher confirmed as used. Thanks for your purchase and for feeding children in need through your dining.'
        else
          response = "Unable to find an active voucher for telephone number #{from}."
        end
      end
      sendText(from, response)
    end

    render nothing: true
  end

  def used_code
    body = params[:Body]
    from = params[:From]

    from.gsub!(/[^0-9]/, '') unless from.blank?

    unless body.blank?
      body.upcase!
      payment = Payment.find_by(code: body)
      if payment.blank?
        body.downcase!
        payment = Payment.find_by(code: body)
      end
      payment.state = 'Used'
      payment.save
    end

    response = "Voucher #{body} confirmed as used. Thanks for your purchase and for feeding children in need through your dining."

    sendText(from, response)

    render nothing: true
  end
end
