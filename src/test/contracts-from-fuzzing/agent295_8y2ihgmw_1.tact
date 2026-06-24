struct Level3 {
    deepVal: Int;
}

struct Level2 {
    innerStruct: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    count: Int;
    name: String;
    isActive: Bool;
}

contract DeepNestedFields {
    data: Level1;
    
    init() {
        self.data = Level1{
            nested: Level2{
                innerStruct: Level3{
                    deepVal: 42
                },
                flag: true
            },
            count: 1,
            name: "hello",
            isActive: false
        };
    }
}