struct NestedOption {
    inner: InnerOpt?;
}

struct InnerOpt {
    str: String;
}

contract NullInnerOption {
    data: NestedOption;

    init() {
        self.data = NestedOption{ inner: null };
    }
}