struct DeepOpt {
    a: Int?;
    b: Bool?;
}

struct WrapOpt {
    deep: DeepOpt?;
}

contract OuterOpt {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{
            deep: DeepOpt{
                a: null,
                b: null
            }
        };
    }
}