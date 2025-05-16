struct InnerMost {
    x: Int?;
    y: Bool?;
}

struct Middle {
    inner: InnerMost?;
    label: String?;
}

struct Outer {
    mid: Middle?;
    z: Int;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: null,
            z: 42,
        };
    }
}