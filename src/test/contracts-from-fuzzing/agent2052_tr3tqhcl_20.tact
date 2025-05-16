struct InnerMost {
    z: Bool;
}

struct Inner {
    y: InnerMost;
}

struct Outer {
    x: Inner;
}

contract DeepStructAssign {
    val: Outer;

    init() {
        self.val = Outer{
            x: Inner{
                y: InnerMost{
                    z: true
                }
            }
        };
    }
}