struct RefOpts {
    a: Cell?;
    b: Slice?;
    c: String?;
}

contract OptStructWithRefs {
    os: RefOpts?;

    init() {
        self.os = null;
    }
}