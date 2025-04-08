struct InnerOptional {
    txt: String?;
}

struct Inner {
    o: InnerOptional;
    flag: Bool;
}

contract NestedOptionalStructInside {
    inner: Inner;

    init() {
        self.inner = Inner{ o: InnerOptional{txt: null}, flag: false };
    }
}