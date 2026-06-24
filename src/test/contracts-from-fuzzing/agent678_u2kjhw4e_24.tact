struct Inner {
    x: Int;
}

struct Middle {
    maybeInner: Inner?;
}

struct Outer {
    maybeMiddle: Middle?;
    y: Int;
}

contract TestContract {
    storage: Outer;
    init() {
        self.storage = Outer{
            maybeMiddle: null,
            y: 42
        };
    }
}