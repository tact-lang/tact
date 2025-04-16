struct SOpt {
    foo: Int?;
}

contract DoubleNestedOptionals {
    opt: SOpt?;
    init() {
        self.opt = null;
    }
}