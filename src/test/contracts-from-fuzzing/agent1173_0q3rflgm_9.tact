struct InnerMost {
    z: Bool;
}

struct Inner {
    y: Int;
    deep: InnerMost;
}

struct Outer {
    x: Int;
    inner: Inner;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer {
            x: 5,
            inner: Inner {
                y: 6,
                deep: InnerMost {z: true}
            }
        };
    }
}
