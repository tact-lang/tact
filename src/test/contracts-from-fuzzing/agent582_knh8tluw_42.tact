struct Outer {
    f1: Int;
    inner: Middle
}

struct Middle {
    f2: Int;
    leaf: InnerMost;
}

struct InnerMost {
    f3: Int;
}

contract StructTiered {
    val: Outer;

    init() {
        self.val = Outer{
            f1:1,
            inner: Middle{
                f2:2,
                leaf: InnerMost{ f3:3 }
            }
        };
    }
}
