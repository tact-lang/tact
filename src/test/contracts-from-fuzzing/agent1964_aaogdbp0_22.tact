contract LongFieldNames {
    this_is_a_long_field_name_for_testing: Int;
    another_extremely_long_field_name_to_check_limits: Bool;

    init() {
        self.this_is_a_long_field_name_for_testing = 1;
        self.another_extremely_long_field_name_to_check_limits = true;
    }
}