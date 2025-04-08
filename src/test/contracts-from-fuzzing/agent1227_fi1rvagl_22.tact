struct LongNames {
    this_is_a_very_long_field_name_number_one_that_tests_limits: Int;
    another_extremely_verbose_and_painfully_long_identifier_here: Int;
}
contract LongFieldNames {
    data: LongNames;
    init() {
        self.data = LongNames{
            this_is_a_very_long_field_name_number_one_that_tests_limits: 1,
            another_extremely_verbose_and_painfully_long_identifier_here: 2
        };
    }
}
