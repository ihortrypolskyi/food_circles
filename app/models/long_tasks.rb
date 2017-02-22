# frozen_string_literal: true
class LongTasks < ApplicationRecord
  def self.handle_email(r)
    UserMailer.delay.voucher(current_user, r)
  end

  def handle_text(r)
    if current_user.phone
      code = (current_user.name ? "#{current_user.name.titleize} for #{r.offer.min_diners}" : r.coupon)
      sendText(current_user.phone, "Thank you for using Foodcircles! Your code is \"#{code}\" for #{r.offer.name} at #{r.venue.name}.")
    end
  rescue
    # we tried
  end

  handle_asynchronously :handle_text
end
