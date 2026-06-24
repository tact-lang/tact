struct Outer {
    field1: Int;
    inner: Inner;
}

struct Inner {
    nested: Int;
}

contract Test34 {
    st: Outer;
    init() {
        self.st = Outer{field1: 7, inner: Inner{nested: 123}};
    }
}
