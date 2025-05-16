struct OptionalNested {
    opt1: Int?;
    opt2: Bool?;
    optStruct: InnerOpt?;
}

struct InnerOpt {
    a: Int;
    b: String;
}

contract OptionalNestedContract {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            opt1: null,
            opt2: null,
            optStruct: null
        };
    }
}
