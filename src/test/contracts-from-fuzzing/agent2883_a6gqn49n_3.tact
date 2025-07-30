struct OptNested {
    innerOpt: String?;
    deepOpt: Int?;
}

contract OptionalNestedStruct {
    rec: OptNested?;

    init() {
        self.rec = OptNested{
            innerOpt: null,
            deepOpt: 123
        };
    }
}