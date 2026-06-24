contract LongNames {
    this_is_a_very_long_and_unusual_field_name_for_fuzzing: Int;
    another_extremely_long_field_name_to_push_the_limits: String;

    init() {
        self.this_is_a_very_long_and_unusual_field_name_for_fuzzing = 123;
        self.another_extremely_long_field_name_to_push_the_limits = "hello";
    }
}
