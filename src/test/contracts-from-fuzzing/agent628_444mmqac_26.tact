struct Outer {
    a: Int;
    inner: Inner;
}

struct Inner {
    b: Int;
    c: String;
}

contract NestedStructs {
    root: Outer;

    init() {
        self.root = Outer{ a:1, inner: Inner{ b:2, c:"hi" } };
    }
}