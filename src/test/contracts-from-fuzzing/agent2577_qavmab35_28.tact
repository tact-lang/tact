struct NestedSerialize {
    n1: Int as uint4;
    next: InnerSerialize;
}

struct InnerSerialize {
    val1: Int as int64;
    val2: Int;
}

contract SerializeNest {
    s: NestedSerialize;

    init() {
        self.s = NestedSerialize{
            n1:3,
            next: InnerSerialize{val1:5,val2:6}
        };
    }
}
