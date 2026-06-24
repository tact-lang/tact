struct WeirdLongNames {
    this_is_a_really_long_field_name_with_numbers_1234567890_and_letters: Int;
    another_extremely_long_field_name_with_mixed_CASE_and_numbers_0987654321: String;
}

contract TestContract {
    weird: WeirdLongNames;

    init() {
        self.weird = WeirdLongNames{
            this_is_a_really_long_field_name_with_numbers_1234567890_and_letters: 5,
            another_extremely_long_field_name_with_mixed_CASE_and_numbers_0987654321: "ok"
        };
    }
}