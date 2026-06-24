struct Inner { x: Int; }
struct Outer { inner: Inner?; }

contract OptionalNestedStructInit {
    s: Outer;

    init() {
        self.s = Outer{
            inner: Inner{ x: 10 }
        };
    }
}