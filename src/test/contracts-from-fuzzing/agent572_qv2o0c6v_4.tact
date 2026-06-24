struct WithOptional {
    maybeInt: Int?;
    available: Bool;
}

contract OptionalStructField {
    s: WithOptional;
    init() {
        self.s = WithOptional{ maybeInt: null, available: true };
    }
}