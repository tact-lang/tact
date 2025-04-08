struct DeepOpt {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    s: String?;
    flag: Bool?;
}

contract DeepOptFields {
    storage: DeepOpt;

    init() {
        self.storage = DeepOpt{
            a: 12,
            b: InnerOpt{
                s: "x",
                flag: false,
            },
        };
    }
}