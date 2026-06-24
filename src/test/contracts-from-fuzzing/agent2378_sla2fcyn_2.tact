struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    inner: Inner;
    c: Int?;
}

contract TestNested {
    data: Outer;
    init() {
        self.data = Outer{inner: Inner{a: 5, b: null}, c: null};
    }
}