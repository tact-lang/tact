struct DeepMix {
    i: Int;
    opt: Bool?;
    sub: Sub;
}

struct Sub {
    str: String;
    innerOpt: Int?;
}

contract DeepMixContract {
    data: DeepMix;

    init() {
        self.data = DeepMix{
            i: 7,
            opt: null,
            sub: Sub{
                str: "text",
                innerOpt: 123
            }
        };
    }
}
