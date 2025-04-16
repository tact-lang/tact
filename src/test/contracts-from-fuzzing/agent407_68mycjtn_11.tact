struct NestedOptInner { i: Int?; }
struct NestedOptOuter { inner: NestedOptInner?; }

contract OptNest {
    val: NestedOptOuter;
    init() {
        self.val = NestedOptOuter{ inner: null };
    }
}
