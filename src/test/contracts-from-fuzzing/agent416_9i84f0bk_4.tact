struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

struct Outer {
    x: Inner;
}

contract VeryDeep {
    nest: Outer;

    init() {
        self.nest = Outer{ x: Inner{ y: InnerMost{ z: 777 } } };
    }
}