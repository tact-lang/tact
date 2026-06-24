struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost;
}

struct Outer {
    x: Middle;
}

contract Deep {
    data: Outer;

    init() {
        self.data = Outer{
            x: Middle{
                y: InnerMost{
                    z: 123
                }
            }
        };
    }
}