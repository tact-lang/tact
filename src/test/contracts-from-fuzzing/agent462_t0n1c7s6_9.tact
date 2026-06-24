struct OptionInStruct {
    s: InnerOpt;
    flag: Bool;
}

struct InnerOpt {
    value: Int?;
    text: String?;
}

contract StructWithInnerOptions {
    s: OptionInStruct;

    init() {
        self.s = OptionInStruct{
            s: InnerOpt{
                value: null,
                text: null
            },
            flag: false
        };
    }
}