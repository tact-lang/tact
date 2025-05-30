struct Level3 {
    deepField: Int?;
    flag: Bool;
}

struct Level2 {
    inner: Level3;
    name: String;
}

struct Level1 {
    nested: Level2;
    count: Int;
}

contract VeryDeepNest {
    storage: Level1;
    init() {
        self.storage = Level1{
            nested: Level2{
                inner: Level3{deepField:null, flag:false},
                name: "deep"
            },
            count: 123
        };
    }
}