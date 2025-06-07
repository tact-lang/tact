// test serialization overrides with nesting
struct Inner {
    a: Int as uint8;
    b: Bool;
}
struct Outer {
    x: Int as uint16;
    inner: Inner;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            x: 1024,
            inner: Inner{a: 255, b: true}
        };
    }
}