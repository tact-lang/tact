struct OptionalInsideStruct {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract ContractWithStructOptionals {
    field: OptionalInsideStruct;
    optionalField: OptionalInsideStruct?;

    init() {
        self.field = OptionalInsideStruct{ x:null, y:null, s:null };
        self.optionalField = null;
    }
}
