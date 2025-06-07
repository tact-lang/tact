struct LongFieldNames {
    this_is_a_very_long_field_name_for_testing: Int;
    simple: Bool;
}

contract TestContract {
    data: LongFieldNames;

    init() {
        self.data = LongFieldNames{
            this_is_a_very_long_field_name_for_testing: 10,
            simple: true
        };
    }
}