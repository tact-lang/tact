struct NestedBoolOpt {
    b1: Bool?;
    b2: Bool?;
}

contract PersistNestedBoolOpts {
    foo: NestedBoolOpt;
    init() {
        self.foo = NestedBoolOpt{ b1: null, b2: null };
    }
}