struct InnerMost {
    flag: Bool;
    str: String?;
}

struct Inner {
    value: Int;
    nested: InnerMost;
}

struct Middle {
    middleVal: Int?;
    inner: Inner;
}

struct Outer {
    outerVal: Int;
    nestedMiddle: Middle;
}

contract MultiLevelOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            outerVal: 10,
            nestedMiddle: Middle{
                middleVal: null,
                inner: Inner{
                    value: 20,
                    nested: InnerMost{
                        flag: true,
                        str: null,
                    }
                }
            }
        };
    }
}