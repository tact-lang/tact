struct InnerMost {
    z: Int;
}

struct Middle {
    x: Int;
    y: InnerMost;
}

struct Outer {
    flag: Bool;
    mid: Middle;
}

contract NestedWithBool {
    rec: Outer;

    init() {
        self.rec = Outer{
            flag: true,
            mid: Middle{
                x: 81,
                y: InnerMost{
                    z: 999
                }
            }
        };
    }
}