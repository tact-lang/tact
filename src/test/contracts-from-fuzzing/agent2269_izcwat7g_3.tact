struct Level2 {
    a: Int;
    b: Int?;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract DeepNestedStruct {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{a: 5, b: null},
            flag: true
        };
    }
}
