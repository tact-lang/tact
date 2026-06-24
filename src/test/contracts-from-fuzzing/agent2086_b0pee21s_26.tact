contract LongFieldNames {
    this_is_a_very_long_field_name_to_test_the_compiler_handling_of_field_identifiers_with_large_length_limits: Int;
    another_field_with_an_even_longer_name_to_see_if_anything_breaks_or_overflows_internally_in_the_compiler: Bool;

    init() {
        self.this_is_a_very_long_field_name_to_test_the_compiler_handling_of_field_identifiers_with_large_length_limits = 123;
        self.another_field_with_an_even_longer_name_to_see_if_anything_breaks_or_overflows_internally_in_the_compiler = true;
    }
}