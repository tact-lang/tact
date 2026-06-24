struct Nested {
    a: Int;
    b: Bool;
}

contract OptionalNested {
    nestedOpt: Nested?;

    init() {
        self.nestedOpt = null;
    }

    receive() {
        self.nestedOpt = Nested{ a: 1, b: true };
    }
}