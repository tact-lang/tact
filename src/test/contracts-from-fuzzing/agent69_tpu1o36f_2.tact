struct Level3 {
    deepValue: String;
}

struct Level2 {
    nestedDeep: Level3;
    optionalText: String?;
}

struct Level1 {
    flag: Bool;
    nestedMid: Level2;
}

contract DeepNestContract {
    deepStruct: Level1;

    init() {
        self.deepStruct = Level1{
            flag: true,
            nestedMid: Level2{
                nestedDeep: Level3{
                    deepValue: "hello"
                },
                optionalText: null
            }
        };
    }
}