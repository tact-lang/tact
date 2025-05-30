struct LongFieldNames {
    this_is_a_very_long_field_name_for_testing: Int;
    another_extremely_long_field_name_to_test_serialization: Int?;
}

contract TestLongNames {
    data: LongFieldNames;

    init() {
        self.data = LongFieldNames{
            this_is_a_very_long_field_name_for_testing: 123,
            another_extremely_long_field_name_to_test_serialization: null,
        };
    }
}