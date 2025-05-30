struct InnerMost {
    x: Int;
    y: Int;
}

struct InnerLayer {
    point: InnerMost;
    active: Bool;
}

contract MixedNested {
    layer: InnerLayer;
    counter: Int;
    flag: Bool;
    init() {
        self.layer = InnerLayer{ point: InnerMost{ x: 1, y: 2 }, active: true };
        self.counter = 42;
        self.flag = false;
    }
}