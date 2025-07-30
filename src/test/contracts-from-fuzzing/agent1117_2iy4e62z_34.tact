struct OptionalStruct {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract ManyNestedOptional {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct {
            intOpt: null,
            boolOpt: null,
            strOpt: null,
        };
    }
}
