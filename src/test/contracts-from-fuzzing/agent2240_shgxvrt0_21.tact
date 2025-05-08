struct Inner {
    z: Int;
}
struct Mid {
    y: Inner;
}

struct Outer {
    x: Mid;
}

contract ManyLayers {
    stored: Outer;

    init() {
        self.stored = Outer{ x: Mid{ y: Inner{ z: 77 } } };
    }
}