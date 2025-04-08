struct InnerMost {
    z: Int;
}

struct Middle {
    innerMost: InnerMost;
    y: Int;
}

struct Outer {
    inner: Middle;
    x: Int;
}

contract DeepFieldOrderTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Middle{
                innerMost: InnerMost{z:9}, y:5
            },
            x:2
        };
    }
}