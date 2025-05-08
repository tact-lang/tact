struct LongNames {
    this_is_a_very_long_field_name_for_test: Int;
    another_extremely_long_and_obnoxious_field: Bool;
    yet_another_ridiculously_long_field_identifier_here: String;
}

contract LongFieldsContract {
    s: LongNames;

    init() {
        self.s = LongNames{
            this_is_a_very_long_field_name_for_test: 1,
            another_extremely_long_and_obnoxious_field: true,
            yet_another_ridiculously_long_field_identifier_here: "hi"
        };
    }
}