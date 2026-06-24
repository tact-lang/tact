struct S {
    s: Slice?;
}

contract StructWithSliceOpt {
    foo: S;

    init() {
        self.foo = S{ s:null };
    }
}
