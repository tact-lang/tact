struct BigNames {
    this_is_a_very_long_variable_name_a: Int;
    this_is_a_very_long_variable_name_b: Bool;
}

contract TestContract {
    big: BigNames;

    init() {
        self.big = BigNames{
            this_is_a_very_long_variable_name_a: 11,
            this_is_a_very_long_variable_name_b: true,
        };
    }
}