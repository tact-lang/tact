struct InnerMost {
    val: Bool;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    mid: Middle;
}

contract DeepNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{mid: Middle{inner: InnerMost{val:true}}};
    }
}