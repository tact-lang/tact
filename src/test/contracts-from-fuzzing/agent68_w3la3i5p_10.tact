struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int;
    child: InnerMost;
}

struct Middle {
    x: Int;
    child: Inner;
}

struct Outer {
    w: Int;
    child: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            w: 0,
            child: Middle{
                x:1,
                child: Inner{
                    y:2,
                    child: InnerMost{z:3}
                }
            }
        };
    }
}