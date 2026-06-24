struct NestedString {
    s: String;
}

struct NestedOpt {
    inner: NestedString?;
}

contract OptInnerStr {
    data: NestedOpt;

    init() {
        self.data = NestedOpt { inner: null };
    }
}