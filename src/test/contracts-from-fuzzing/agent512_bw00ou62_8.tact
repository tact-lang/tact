struct Inner {
    v: Int;
}

struct Middle {
    x: Inner?;
}

struct Outer {
    y: Middle?;
}

contract NestedOptionalsTest {
    data: Outer;

    init() {
        self.data = Outer{
            y: Middle{
                x: Inner{
                    v: 13
                }
            }
        };
    }
}
