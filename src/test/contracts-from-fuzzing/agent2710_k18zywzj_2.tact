struct Deep {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: Deep;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    count: Int;
}

contract DeepNested {
    store: Outer;

    init() {
        self.store = Outer{ middle: Middle{ inner: Deep{ x: 1, y: false }, flag: true }, count: 10 };
    }
}