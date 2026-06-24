struct NestedInner {
    txt: String;
}

struct Wrapper {
    inner: NestedInner;
}

contract RecWrap {
    field: Wrapper;

    init() {
        self.field = Wrapper{ inner: NestedInner{ txt: "yo" } };
    }
}
