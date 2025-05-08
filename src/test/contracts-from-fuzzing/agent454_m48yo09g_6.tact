struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    x: Int;
    inner: Inner;
    y: Bool;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ x: 9, inner: Inner{ a: 1, b: true, c: "hi" }, y: false };
    }
}