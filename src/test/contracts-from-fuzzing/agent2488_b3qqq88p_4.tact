struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    maybeInner: Inner?;
    c: Int;
}

contract CC {
    item: Outer;

    init() {
        self.item = Outer{
            maybeInner: null,
            c: 5
        };
    }
}