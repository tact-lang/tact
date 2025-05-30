struct InnerStruct {
    inner1: Int;
    inner2: Bool?;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
    label: String?;
}

contract NestedStructTest {
    storage: OuterStruct;
    
    init() {
        self.storage = OuterStruct{
            nested: InnerStruct{
                inner1: 42,
                inner2: true,
            },
            flag: false,
            label: null,
        };
    }
}