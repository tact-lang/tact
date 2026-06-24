struct InnerMost {
    x: Int;
}

struct Middle1 {
    a: InnerMost;
}

struct Middle2 {
    b: InnerMost;
}

struct TopLayer {
    left: Middle1;
    right: Middle2;
}

contract DiamondShapeTest {
    storage: TopLayer;

    init() {
        self.storage = TopLayer{
            left: Middle1{ a: InnerMost{ x: 1 } },
            right: Middle2{ b: InnerMost{ x: 2 } }
        };
    }
}