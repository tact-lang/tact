struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Inner;
    b: Int;
}

contract ParamNested(
    a: Inner,
    b: Int
) {
    receive() {
        // use params
        let _ = self.a.x + self.b;
    }
}