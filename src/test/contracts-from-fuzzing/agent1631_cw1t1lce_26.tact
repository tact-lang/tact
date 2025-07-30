struct OptionalInsideStruct {
    num: Int;
    text: String;
    subOpt: SubOpt?;
}

struct SubOpt {
    f1: Bool?;
    f2: Int?;
    f3: String?;
}

contract OptionalInside {
    val: OptionalInsideStruct;

    init() {
        self.val = OptionalInsideStruct{
            num: 42,
            text: "hi",
            subOpt: SubOpt{
                f1: null,
                f2: null,
                f3: null
            }
        };
    }
}