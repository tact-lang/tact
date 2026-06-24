struct S {
    foo: Int;
    bar: Bool?;
    baz: String;
}

contract OptMid {
    data: S?;

    init() {
        self.data = null;
    }
}
