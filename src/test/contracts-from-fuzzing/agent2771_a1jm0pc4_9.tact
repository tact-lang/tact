struct InnerMost {
    z: Int?;
}

struct Middle {
    y: Int;
    inner: InnerMost;
}

struct OuterMost {
    x: Int;
    middle: Middle;
}

contract MultiLevelOptionals {
    complex: OuterMost;

    init() {
        self.complex = OuterMost{
            x:1,
            middle: Middle{
                y:2,
                inner: InnerMost{z:null}
            }
        };
    }
}