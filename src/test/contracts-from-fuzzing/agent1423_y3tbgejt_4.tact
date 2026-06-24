struct DeepStruct {
    field1: Int;
    field2: Bool;
}

struct MidStruct {
    nested1: DeepStruct;
    nested2: DeepStruct;
}

struct OuterStruct {
    mid: MidStruct;
    flag: Bool;
}

contract NestedLayers {
    s: OuterStruct;
    
    init() {
        self.s = OuterStruct{
            mid: MidStruct{
                nested1: DeepStruct{ field1: 1, field2: false },
                nested2: DeepStruct{ field1: 2, field2: true }
            },
            flag: true
        };
    }
}