struct InnerOpt {
    value: Int?;
}

contract OuterMaybeStruct {
    foo: InnerOpt?;

    init() {
        self.foo = null;
    }
}
