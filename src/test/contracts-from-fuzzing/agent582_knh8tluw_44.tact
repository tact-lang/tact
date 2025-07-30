struct DeepOptWrap {
    val: MidOpt?;
}

struct MidOpt {
    value: Int?;
    flag: Bool;
}

contract DeepOptionalDefault {
    s: DeepOptWrap;

    init() {
        self.s = DeepOptWrap{
            val: MidOpt{
                value: null,
                flag: true
            }
        };
    }
}
