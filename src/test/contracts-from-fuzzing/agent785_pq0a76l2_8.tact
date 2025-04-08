struct SVariant {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optBool: Bool?;
    optString: String?;
}

contract VariantFields {
    sv: SVariant;
    init() {
        self.sv = SVariant{
            intVal: 11,
            boolVal: false,
            stringVal: "abc",
            optBool: null,
            optString: "maybe"
        };
    }
}
