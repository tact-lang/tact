struct DeepOptionalStruct {
    a: Int?;
    b: Int?;
}

struct MidOptionalStruct {
    nested1: DeepOptionalStruct?;
    nested2: DeepOptionalStruct?;
}

contract OptionalChainTest {
    deep: MidOptionalStruct;
    init() {
        self.deep = MidOptionalStruct{
            nested1: DeepOptionalStruct{a:null,b:null},
            nested2: null
        };
    }
}