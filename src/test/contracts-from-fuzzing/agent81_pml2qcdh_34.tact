struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    s: String?;
    b: Bool?;
}

contract Test {
    f: DeepOpt;

    init() {
        self.f = DeepOpt{
            inner: InnerOpt{
                s: "deep",
                b: null
            }
        };
    }
}