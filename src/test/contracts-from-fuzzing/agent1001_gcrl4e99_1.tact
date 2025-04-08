struct InnerStruct {
    flag: Bool;
    count: Int as uint32;
}

struct OuterStruct {
    nested: InnerStruct;
    description: String;
    bigNumber: Int;
    optionalFlag: Bool?;
}

contract TestContract {
    data: OuterStruct;
    
    init() {
        self.data = OuterStruct{
            nested: InnerStruct{ flag: true, count: 42 },
            description: "test",
            bigNumber: 123456789,
            optionalFlag: null
        };
    }
}