struct LongNames {
    this_is_a_really_long_field_name_1: Int;
    this_is_a_really_long_field_name_2: Bool;
    this_is_a_really_long_field_name_3: Address;
    this_is_a_really_long_field_name_4: String;
}

contract LongNamesContract {
    data: LongNames;

    init() {
        self.data = LongNames{
            this_is_a_really_long_field_name_1: 42,
            this_is_a_really_long_field_name_2: true,
            this_is_a_really_long_field_name_3: myAddress(),
            this_is_a_really_long_field_name_4: "test"
        };
    }
}