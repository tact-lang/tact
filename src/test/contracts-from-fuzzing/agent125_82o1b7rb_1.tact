struct SimpleNested {
    innerVal: Int;
}

contract TestContract {
    foo: SimpleNested;
    init() {
        self.foo = SimpleNested{ innerVal: 10 };
    }
}