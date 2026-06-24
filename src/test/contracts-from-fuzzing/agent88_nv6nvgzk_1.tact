struct InnerStruct {
    value1: Int;
    value2: Bool?;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
    count: Int?;
}

contract TestContract {
    data: OuterStruct;
    
    init() {
        self.data = OuterStruct{
            nested: InnerStruct{
                value1: 1,
                value2: true,
            },
            flag: false,
            count: null,
        };
    }
}