struct InnerMost {
    val: Int;
}

struct Middle {
    nested: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepStructTest {
    deepField: Outer;

    init() {
        self.deepField = Outer{
            mid: Middle{
                nested: InnerMost{
                    val: 42
                }
            }
        };
    }
}