struct InnerMost {
    val: Int;
}

struct Middle {
    nested: InnerMost;
}

struct Top {
    nested: Middle;
}

contract ManyLayers {
    state: Top;
    init() {
        self.state = Top{ nested: Middle{ nested: InnerMost{ val: 99 } } };
    }
}