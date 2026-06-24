struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    inner: Inner;
    y: Bool;
}

contract NestedMiddle {
    storage: Outer;

    init() {
        self.storage = Outer{
            x: 1,
            inner: Inner{a:2,b:true},
            y: false
        };
    }
}
