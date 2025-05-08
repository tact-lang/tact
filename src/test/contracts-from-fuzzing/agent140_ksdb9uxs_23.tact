struct NestedStrOpt {
    inner: String?;
}

struct Outer {
    n: NestedStrOpt;
}

contract OptStringPath {
    val: Outer;

    init() {
        self.val = Outer{
            n: NestedStrOpt{ inner: null }
        };
    }
}