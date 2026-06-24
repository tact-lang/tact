struct DoubleNested {
    deep: Int?;
}

struct NestedWrap {
    x: DoubleNested?;
}

struct OuterMost {
    val: NestedWrap?;
}

contract DoubleNestedOptional {
    v: OuterMost;

    init() {
        self.v = OuterMost{ val:null };
    }
}