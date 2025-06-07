struct OptionalNested {
    val: Int?;
    flag: Bool?;
}

contract OptNestedStorage {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{ val: null, flag: true };
    }
}