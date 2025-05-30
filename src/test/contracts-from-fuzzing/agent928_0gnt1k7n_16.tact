struct InnerMost {
    f: Int?;
}

struct Inner {
    im: InnerMost;
}

contract DeeplyNested {
    deep: Inner;

    init() {
        self.deep = Inner{ im: InnerMost{ f: null } };
    }
}