struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract Test {
    stored: Outer?;

    init() {
        self.stored = Outer{
            middle: null
        };
    }
}