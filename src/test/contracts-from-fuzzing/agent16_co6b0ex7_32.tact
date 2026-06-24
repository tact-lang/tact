struct OuterMost {
    inner: InnerMost;
}

struct InnerMost {
    innerStr: InnerInner;
}

struct InnerInner {
    val: String;
}

contract DeepStrings {
    data: OuterMost;

    init() {
        self.data = OuterMost{inner: InnerMost{innerStr: InnerInner{val:"hi"}}};
    }
}