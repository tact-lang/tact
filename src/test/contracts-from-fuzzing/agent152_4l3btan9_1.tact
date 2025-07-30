struct NestedStruct {
    flag: Bool;
    value: Int;
    content: String;
    optionalFlag: Bool?;
}

struct OuterStruct {
    nested: NestedStruct;
    description: String;
    active: Bool;
}

contract TestContract {
    data: OuterStruct;
    
    init() {
        self.data = OuterStruct{
            nested: NestedStruct{
                flag: false,
                value: 999,
                content: "hello",
                optionalFlag: null
            },
            description: "outer",
            active: true
        };
    }
}
