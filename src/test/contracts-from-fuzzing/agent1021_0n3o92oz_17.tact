struct InnerBool {
    flag: Bool;
}

struct WithInnerOptional {
    inn: InnerBool?;
}

contract OptionalInnerStruct {
    val: WithInnerOptional;

    init() {
        self.val = WithInnerOptional{};
    }
}