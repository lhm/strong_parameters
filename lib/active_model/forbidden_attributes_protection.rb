module ActiveModel
  class ForbiddenAttributes < StandardError
  end

  module ForbiddenAttributesProtection
    def sanitize_for_mass_assignment(new_attributes, role=nil)
      if !new_attributes.respond_to?(:permitted?) || new_attributes.permitted?
        super
      else
        raise ActiveModel::ForbiddenAttributes
      end
    end
  end
end

ActiveModel.autoload :ForbiddenAttributesProtection
