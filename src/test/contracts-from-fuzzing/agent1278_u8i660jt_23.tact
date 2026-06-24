struct InnerMost {
    z: Int;
}

struct Middle {
    x: Int?;
    y: InnerMost?;
}

struct Outer {
    mid: Middle;
}

contract NullDeepMix {
    val: Outer;

    init() {
        self.val = Outer{ mid: Middle{ x: null, y: null } };
    }
}