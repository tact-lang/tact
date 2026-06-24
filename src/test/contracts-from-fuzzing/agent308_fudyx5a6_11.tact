struct Middle {
    left: Int;
    right: Int;
}

struct NestedMiddle {
    m1: Middle;
    m2: Middle;
}

contract ManyNestedStructs {
    inner: NestedMiddle;

    init() {
        self.inner = NestedMiddle{
            m1: Middle{left:1,right:2},
            m2: Middle{left:3,right:4}
        };
    }
}
