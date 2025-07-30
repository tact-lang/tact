struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract TripleNest {
    val: Outer;
    init() {
        self.val = Outer{
            middle: Middle{
                inner: Inner{
                    x: 123
                }
            }
        };
    }
}
