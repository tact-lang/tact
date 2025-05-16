struct InnerMost {
    val: Int;
}

struct Middle {
    nest: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepNested {
    storageNest: Outer;

    init() {
        self.storageNest = Outer{
            mid: Middle{
                nest: InnerMost{
                    val: 123
                }
            }
        };
    }
}