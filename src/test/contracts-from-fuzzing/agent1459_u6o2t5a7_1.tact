struct InnerStruct {
    val: Int;
}

struct OuterStruct {
    nested: InnerStruct;    
    optionalVal: Int?;      
}

contract NestedStructTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: InnerStruct{ val: 42 },
            optionalVal: null,
        };
    }
}
