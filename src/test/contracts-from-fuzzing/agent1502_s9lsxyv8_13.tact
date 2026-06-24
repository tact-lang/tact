struct InnerMost {
    x: Int;
}
struct Inner {
    innerMost: InnerMost;
    y: Bool;
}
struct Outer {
    inner: Inner;
    z: String;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            inner: Inner{
                innerMost: InnerMost{ x: 99 },
                y: false
            },
            z: "nested"
        };
    }
}