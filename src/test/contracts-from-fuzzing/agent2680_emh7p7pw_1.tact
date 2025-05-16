struct NestedStruct {
    level1: Int;
    optionalLevel2: DeepStruct?;
}

struct DeepStruct {
    level2: Int;
    optionalLevel3: VeryDeepStruct?;
}

struct VeryDeepStruct {
    level3: Int;
    message: String;
}

contract DeepNestTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            level1: 1,
            optionalLevel2: DeepStruct{
                level2: 2,
                optionalLevel3: VeryDeepStruct{
                    level3: 3,
                    message: "Deep"
                }
            }
        };
    }
}