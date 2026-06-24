struct Names {
    a_long_name_really_long_name_number_one: Int;
    another_extremely_long_variable_name_that_is_crazy_long: Bool;
    this_is_getting_ridiculous_but_keep_going_anyway_right: String;
}

contract LongNames {
    data: Names;

    init() {
        self.data = Names{
            a_long_name_really_long_name_number_one: 1,
            another_extremely_long_variable_name_that_is_crazy_long: false,
            this_is_getting_ridiculous_but_keep_going_anyway_right: "done"
        };
    }
}