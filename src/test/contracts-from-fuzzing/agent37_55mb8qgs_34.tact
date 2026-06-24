struct InnerMost {
    val: Int;
}

struct Inner {
    inner: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract VeryDeep {
    deep: Outer;

    init() {
        self.deep = Outer{
            middle: Middle{
                inner: Inner{
                    inner: InnerMost{ val:555 }
                }
            }
        };
    }
}
