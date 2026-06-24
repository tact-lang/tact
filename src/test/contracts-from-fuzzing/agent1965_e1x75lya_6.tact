struct NestedOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int;
    note: String?;
}

contract OptDeepOptional {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{ inner: null };
    }
}