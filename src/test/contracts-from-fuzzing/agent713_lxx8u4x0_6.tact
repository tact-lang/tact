struct Bottom {
    x: Int;
}

struct Middle {
    y: Bottom;
}

struct Top {
    z: Middle;
}

contract ThreeLayerNested {
    v: Top;

    init() {
        self.v = Top{ z: Middle{ y: Bottom{ x: 42 } } };
    }
}