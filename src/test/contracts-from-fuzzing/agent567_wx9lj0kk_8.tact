// Deep nested optional inside struct inside persistent var
struct InnerMost {
    val: Int?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    nestedOpt: Outer;
    init() {
        self.nestedOpt = Outer{
            middle: Middle{
                inner: InnerMost{
                    val: null
                }
            }
        };
    }
}
