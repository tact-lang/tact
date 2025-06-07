struct LongNames {
    this_is_a_very_long_field_name_one: Int;
    this_is_a_very_long_field_name_two: String?;
    this_is_a_very_long_field_name_three: Bool?;
}

contract LongIdentifiers {
    big_field: LongNames;

    init() {
        self.big_field = LongNames{
            this_is_a_very_long_field_name_one: 1,
            this_is_a_very_long_field_name_two: null,
            this_is_a_very_long_field_name_three: true,
        };
    }
}
