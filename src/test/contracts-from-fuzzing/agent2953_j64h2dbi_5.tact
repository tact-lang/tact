struct ComplexOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract ContractWithOptionalStruct {
    persistent: ComplexOptional;

    init() {
        self.persistent = ComplexOptional{
            x: null,
            y: true,
            z: null,
        };
    }
}