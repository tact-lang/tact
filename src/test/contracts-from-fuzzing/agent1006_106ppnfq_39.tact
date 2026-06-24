struct Inner {
    a: Int;
    b: String;
}

struct Middle {
    x: Int;
    inner: Inner;
}

struct Outer {
    middle: Middle;
    s: String;
}

contract Deep {
    val: Outer;

    init() {
        self.val = Outer{
            middle: Middle{ x: 42, inner: Inner{ a: 1, b: "ok" } }, s: "world" };
    }
}
