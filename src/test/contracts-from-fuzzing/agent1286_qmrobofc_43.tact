struct NestedOptInner {
    a: Int?;
    b: Bool?;
}

struct NestedOptOuter {
    inner: NestedOptInner?;
}

contract NestedOptComplex {
    val: NestedOptOuter;

    init() {
        self.val = NestedOptOuter{ inner:null };
    }
}