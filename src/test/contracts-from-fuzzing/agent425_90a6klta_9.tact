struct InnerMost {
    val: Int as uint16;
}

struct Middle {
    midVal: Int as int32;
    nested: InnerMost;
}

struct Outer {
    outerVal: Int as uint8;
    mid: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            outerVal: 250,
            mid: Middle{
                midVal: -12345,
                nested: InnerMost{
                    val: 65535
                }
            }
        };
    }
}