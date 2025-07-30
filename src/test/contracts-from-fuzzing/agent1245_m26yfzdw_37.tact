struct DeepOpt {
    inner: MidOpt?;
}

struct MidOpt {
    foo: Int?;
    bar: Bool?;
}

contract SuperOpt {
    d: DeepOpt;

    init() {
        self.d = DeepOpt{
            inner: MidOpt{
                foo: 10,
                bar: null
            },
        };
    }
}
