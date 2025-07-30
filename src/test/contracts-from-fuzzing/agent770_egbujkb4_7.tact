struct DeepOpt {
    inner: Int?;
    flag: Bool?;
}

struct MidOpt {
    nested: DeepOpt?;
    t: String;
}

contract OptNest {
    data: MidOpt?;

    init() {
        self.data = MidOpt{
            nested: DeepOpt{
                inner: 5,
                flag: true,
            },
            t: "ok",
        };
    }
}
