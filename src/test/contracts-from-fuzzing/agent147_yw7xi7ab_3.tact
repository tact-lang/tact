struct NestedOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract Test {
    field: NestedOpt;

    init() {
        self.field = NestedOpt{ inner: null };
    }
}