struct DeepOpt {
    s: String?;
    b: Bool?;
    i: Int?;
}

struct MiddleOpt {
    inner: DeepOpt;
    a: Int;
}

contract OptNest {
    data: MiddleOpt;
    init() {
        self.data = MiddleOpt{
            inner: DeepOpt{
                s: null,
                b: null,
                i: null
            },
            a: 0
        };
    }
}