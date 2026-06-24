contract ContractOptionalStruct {
    x: OptionalStruct?;

    init() {
        self.x = null;
    }
}

struct OptionalStruct {
    a: Int;
    b: Bool?;
}