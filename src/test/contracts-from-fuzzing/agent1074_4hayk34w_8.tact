struct OptionalDeep {
    innerOpt: Inner?;
}

struct Inner {
    nestedOpt: InnerMost?;
}

struct InnerMost {
    x: Int;
    b: Bool;
}

contract OptDepthTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep {
            innerOpt: Inner {
                nestedOpt: InnerMost { x: 5, b: true }
            }
        };
    }
}