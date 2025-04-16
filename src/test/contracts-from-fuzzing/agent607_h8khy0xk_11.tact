struct OptionalNestedStruct {
    a: Int;
    b: String;
}

contract HasOptionalStruct {
    val: OptionalNestedStruct?;

    init() {
        self.val = OptionalNestedStruct{ a: 404, b: "missing" };
    }
}