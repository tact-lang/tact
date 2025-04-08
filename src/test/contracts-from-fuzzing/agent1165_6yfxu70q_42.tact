contract LongFieldNames {
    this_is_the_first_field_with_a_long_name: Int;
    and_another_very_long_named_boolean_flag: Bool;
    the_storage_address_field_finally_named_rather_long: Address;
    
    init() {
        self.this_is_the_first_field_with_a_long_name = 1;
        self.and_another_very_long_named_boolean_flag = true;
        self.the_storage_address_field_finally_named_rather_long = myAddress();
    }
}
