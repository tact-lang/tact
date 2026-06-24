struct InnerOpt {
    v: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptStructInOptStruct {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
        };
    }
}
