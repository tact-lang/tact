struct WithOption {
    optionalInt: Int?;
}

contract OptionalDefault {
    field: WithOption;
    init() {
        self.field = WithOption{}; // test default null
    }
}