struct SOpt {
    optInt: Int?;
    optBool: Bool?;
}

contract OptionalInsideStruct {
    nestedOpt: SOpt;

    init() {
        self.nestedOpt = SOpt{
            optInt: null,
            optBool: false,
        };
    }
}