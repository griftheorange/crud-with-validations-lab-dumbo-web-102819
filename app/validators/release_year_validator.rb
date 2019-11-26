class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.released
            if record.release_year == nil
                record.errors[:release_year] << "You must give a release year for released songs."
            elsif record.release_year > Time.now.strftime("%Y").to_i
                record.errors[:release_year] << "The song can not be released in the future."
            end
        end
    end
end