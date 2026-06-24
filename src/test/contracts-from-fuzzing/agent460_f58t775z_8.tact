struct DeeplyNestedOptional {
    id: Int;
    nestedOpt: Level1?;
}

struct Level1 {
    field1: Int;
    level2opt: Level2?;
}

struct Level2 {
    name: String;
    level3opt: Level3?;
}

struct Level3 {
    flag: Bool;
}

contract TestDeepOpt {
    data: DeeplyNestedOptional = DeeplyNestedOptional{
        id: 7,
        nestedOpt: null
    };
    init() {
        self.data = DeeplyNestedOptional{
            id: 8,
            nestedOpt: Level1{
                field1: 1,
                level2opt: Level2{
                    name: "name",
                    level3opt: Level3{ flag: true }
                }
            }
        };
    }
}
