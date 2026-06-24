struct InnerMost {
    z: Int;
}

struct Mid {
    y: InnerMost?;
}

struct Outer {
    x: Mid;
}

contract OptionalDeep {
    layered: Outer;

    init() {
        self.layered = Outer {
            x: Mid {
                y: InnerMost { z: 999 }
            }
        };
    }
}