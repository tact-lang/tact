struct DeepStruct {
    level1: Int;
    level2: Int?;
    level3: InnerStruct?;
}

struct InnerStruct {
    innerVal: Int;
    deepOpt: Int?;
}

contract Test {
    deepField: DeepStruct;

    init() {
        self.deepField = DeepStruct{
            level1: 42,
            level2: null,
            level3: null,
        };
    }
}
