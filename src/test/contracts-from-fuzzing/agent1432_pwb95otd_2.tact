struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    nestedOpt: Nested?;

    init() {
        self.nestedOpt = Nested{ a: 1, b: true };
    }
}