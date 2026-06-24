struct InnerOpt {
    val: Int?;
}

struct NestedOptOpt {
    inner: InnerOpt?;
}

contract InheritedNestedOpt {
    f: NestedOptOpt;

    init() {
        self.f = NestedOptOpt{ inner: InnerOpt{ val: null } };
    }
}
