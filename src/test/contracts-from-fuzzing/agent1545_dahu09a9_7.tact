struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

struct Middle {
    x: Inner;
}

contract DeepChain {
    value: Middle;

    init() {
        self.value = Middle{ x: Inner{ y: InnerMost{ z: 123 } } };
    }
}
