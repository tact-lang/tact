struct OptionalNestedStruct {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Int;
    flag: Bool;
}

contract OptionalNest {
    rec: OptionalNestedStruct;

    init() {
        self.rec = OptionalNestedStruct{
            innerOpt: null
        };
    }
}