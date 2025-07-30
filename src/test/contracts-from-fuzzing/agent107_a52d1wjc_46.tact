struct SOpt {
    value: Int?;
}

contract BothOptVals {
    foo: SOpt?;
    bar: SOpt?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}