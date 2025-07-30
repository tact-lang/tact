struct OptionalNested {
    flag: Bool?;
    num: Int?;
}

contract OptionalNestedField {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{flag: null, num: null};
    }
}