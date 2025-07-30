struct DeepOpt {
    a: Int?;
    b: Bool;
    c: InnerOpt;
}

struct InnerOpt {
    x: String?;
    y: Bool?;
}

contract OptDeep {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            a: null,
            b: true,
            c: InnerOpt{
                x: "xxx",
                y: null
            }
        };
    }
}