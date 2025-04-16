struct S {
    foo: Int?;
}

contract OuterOpt {
    s: S?;

    init() {
        self.s = null;
    }
}