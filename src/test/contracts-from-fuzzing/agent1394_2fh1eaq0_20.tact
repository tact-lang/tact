struct InnerDepth {
    z: Int?;
    s: String;
}

struct MidDepth {
    x: Int;
    inner: InnerDepth;
}

contract DepthTest {
    nested: MidDepth;

    init() {
        self.nested = MidDepth{
            x: 5,
            inner: InnerDepth{z: null, s: "hi"}
        };
    }
}