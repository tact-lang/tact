struct InnerMost { val: Int }

struct Middle {
    midVal: InnerMost?;
}

struct OuterMost {
    outerVal: Middle?;
}

contract NestedOptionals {
    entry: OuterMost;

    init() {
        self.entry = OuterMost{
            outerVal: Middle{
                midVal: InnerMost{val: 123}
            }
        };
    }
}