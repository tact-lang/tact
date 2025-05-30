struct DeepOptionalStruct {
    v1: Int?;
    v2: Int?;
    v3: Int?;
    v4: Int?;
    v5: Int?;
}

contract OptionalStructsDeep {
    persistent: DeepOptionalStruct?;

    init() {
        self.persistent = DeepOptionalStruct{
            v1: 1,
            v2: 2,
            v3: null,
            v4: 4,
            v5: null,
        };
    }
}