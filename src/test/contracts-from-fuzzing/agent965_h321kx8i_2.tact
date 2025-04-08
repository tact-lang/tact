struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    s: String?;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{a: 1, b: false},
            s: null,
        };
    }
}