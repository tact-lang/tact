struct DeepOpt {
    a: Int?;
    b: Bool?;
}

struct MidOpt {
    c: DeepOpt?;
    s: String;
}

contract NestedStructOptTop {
    data: MidOpt?;

    init() {
        self.data = MidOpt{
            c: DeepOpt{
                a: null,
                b: true,
            },
            s: "opt",
        };
    }
}