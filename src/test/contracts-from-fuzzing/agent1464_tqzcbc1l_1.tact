struct NestedOpt {
    inside: Int?;
}

contract TestContract {
    foo: NestedOpt?;

    init() {
        self.foo = null;
    }
}