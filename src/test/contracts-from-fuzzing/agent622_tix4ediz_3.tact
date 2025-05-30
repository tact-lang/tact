struct InnerMost {
    value: Int;
}

struct Middle {
    midFlag: Bool;
    inner: InnerMost?;
}

struct Outer {
    outerFlag: Bool;
    middle: Middle?;
}

contract OptionalDepthTest {
    data: Outer;

    init() {
        self.data = Outer{
            outerFlag: false,
            middle: null
        };
    }
}