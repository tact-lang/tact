struct Nested {
    i: Int;
}

contract OptNested {
    data: Nested?;
    init() {
        self.data = Nested{ i:123 };
    }
}