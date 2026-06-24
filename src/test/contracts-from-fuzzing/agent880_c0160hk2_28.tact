struct DeepMix {
    a: Int;
    b: InnerMix;
}

struct InnerMix {
    c: Bool?;
    d: Int?;
    e: String;
}

contract ContractMix {
    x: DeepMix;

    init() {
        self.x = DeepMix{
            a: 5,
            b: InnerMix{
                c: null,
                d: 7,
                e: "hi",
            },
        };
    }
}