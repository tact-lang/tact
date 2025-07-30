struct Nested {
    innerVal: Int;
    innerOpt: Int?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ innerVal: 10, innerOpt: null };
    }

    receive() {
        self.nested = Nested{ innerVal: 20, innerOpt: 5 };
    }
}
