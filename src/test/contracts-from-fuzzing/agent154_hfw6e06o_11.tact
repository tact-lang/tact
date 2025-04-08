struct DeepOpt {
    f1: Int?;
    f2: Bool?;
    f3: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract DeepOptContract {
    s: DeepOpt;

    init() {
        self.s = DeepOpt{
            f1: null,
            f2: false,
            f3: InnerOpt{x: null, y: true}
        };
    }
}