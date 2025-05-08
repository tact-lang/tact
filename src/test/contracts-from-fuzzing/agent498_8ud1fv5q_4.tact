struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct OuterMost {
    m1: Middle;
    m2: Middle;
}

contract TestMultiDeep {
    storage: OuterMost = OuterMost{
        m1: Middle{inner: InnerMost{val: 1}, flag: true},
        m2: Middle{inner: InnerMost{val: 2}, flag: false}
    };
}