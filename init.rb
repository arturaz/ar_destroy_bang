# Raised by #destroy! if record was not destroyed.
class ActiveRecord::RecordNotDestroyed < ActiveRecord::ActiveRecordError; end

module ActiveRecord::Persistence
  # Destroys record, raises error if not destroyed.
  def destroy!
    return_value = destroy
    raise ActiveRecord::RecordNotDestroyed.
      new("#{self} was not destroyed!") unless destroyed?
    return_value
  end
end