struct InnerMost {
    x: Int;
}

struct InnerOpt {
    inner: InnerMost?;
}

contract OptStructInStruct {
    data: InnerOpt;

    init() {
        self.data = InnerOpt {
            inner: InnerMost{ x: 100 }
        };
    }
}