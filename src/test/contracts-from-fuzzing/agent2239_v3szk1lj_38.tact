struct NestedStr {
    n1: Int?;
    n2: Bool;
}

contract OptionalWithNested {
    data: NestedStr?;

    init() {
        self.data = null;
    }
}