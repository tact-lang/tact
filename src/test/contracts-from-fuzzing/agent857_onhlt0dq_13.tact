struct DeepOpt {
    optInner: Inner?;
    label: String;
}

struct Inner {
    optNum: Int?;
    ok: Bool;
}

contract Test {
    value: DeepOpt;

    init() {
        self.value = DeepOpt{
            optInner: Inner{
                optNum: null,
                ok: false
            },
            label: "deep"
        };
    }
}