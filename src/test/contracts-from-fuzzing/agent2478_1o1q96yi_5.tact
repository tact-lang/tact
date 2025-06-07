struct OptionalNested {
    value: Int?;
    flag: Bool?;
}

contract OptionalNestedStorage {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{ value: null, flag: null };
    }
}