struct InnerOpt {
    ival: Int?;
    sval: String?;
}

struct Wrapper {
    inner: InnerOpt;
    flag: Bool;
}

contract Test8 {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: InnerOpt{
                ival: null,
                sval: "yo",
            },
            flag: true,
        };
    }
}