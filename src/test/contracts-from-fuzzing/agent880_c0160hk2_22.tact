struct DeepOpt {
    foo: Int?;
    bar: InnerOpt?;
}

struct InnerOpt {
    x: String?;
    y: Bool?;
}

contract OptChains {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            foo: null,
            bar: InnerOpt{
                x: "hi",
                y: null,
            },
        };
    }
}