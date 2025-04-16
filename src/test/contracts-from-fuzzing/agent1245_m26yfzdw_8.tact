struct Child {
    val: Int;
}

contract OptOpt {
    foo: Int?;
    childOpt: Child?;

    init() {
        self.foo = null;
        self.childOpt = null;
    }
}
