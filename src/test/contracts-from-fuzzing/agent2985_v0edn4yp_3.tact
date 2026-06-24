struct WithOptional {
    maybeInt: Int?;
    flag: Bool;
}

contract OptionalStructField {
    record: WithOptional;

    init() {
        self.record = WithOptional{ maybeInt: null, flag: true };
    }
}
