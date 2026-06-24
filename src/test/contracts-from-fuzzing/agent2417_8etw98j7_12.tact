struct InnerWithOpt {
    s: String?;
}

struct NestedWithOpt {
    inner: InnerWithOpt?;
}

contract DeepOptWrap {
    val: NestedWithOpt;

    init() {
        self.val = NestedWithOpt{ inner: InnerWithOpt{ s: null } };
    }
}
