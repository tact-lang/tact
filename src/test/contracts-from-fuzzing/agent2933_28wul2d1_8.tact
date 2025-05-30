struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle?;
}

contract OptionWrap {
    data: Outer?;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{
                    val: 123
                }
            }
        };
    }
}