contract LongKeys {
    this_is_a_long_variable_name_for_testing_persistence_lengths: Int;

    init() {
        self.this_is_a_long_variable_name_for_testing_persistence_lengths = 1;
    }

    receive() {
        self.this_is_a_long_variable_name_for_testing_persistence_lengths += 1;
    }
}