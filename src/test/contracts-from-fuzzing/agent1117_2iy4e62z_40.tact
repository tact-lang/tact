struct NestedOptInner {
    flag: Bool;
    text: String?;
}

struct NestedOptOuter {
    data: NestedOptInner?;
}

contract NestedOpts {
    val: NestedOptOuter;

    init() {
        self.val = NestedOptOuter { data: null };
    }
}
