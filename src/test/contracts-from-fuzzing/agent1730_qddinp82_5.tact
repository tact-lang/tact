struct InnerDeep {
    number: Int;
    flag: Bool;
}

struct MidDeep {
    innerDeepOpt: InnerDeep?;
    text: String;
}

struct OuterDeep {
    int1: Int;
    int2: Int;
    int3: Int;
    str1: String;
    address1: Address;
    bool1: Bool;
    midDeeper: MidDeep?;
}

contract HugeNested {
    bigField: OuterDeep;

    init() {
        self.bigField = OuterDeep{
            int1: 1,
            int2: 2,
            int3: 3,
            str1: "hi",
            address1: myAddress(),
            bool1: true,
            midDeeper: MidDeep{
                innerDeepOpt: InnerDeep{ number: 42, flag: false },
                text: "mid" }
        };
    }
}