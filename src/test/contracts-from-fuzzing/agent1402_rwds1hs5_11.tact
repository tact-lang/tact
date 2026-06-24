struct Inner {
    s: String;
}

struct Outer {
    i: Int;
    inner: Inner;
}

contract OptNested {
    val: Outer?;

    init() {
        self.val = Outer{ i:1, inner: Inner{ s: "str" } };
    }
}