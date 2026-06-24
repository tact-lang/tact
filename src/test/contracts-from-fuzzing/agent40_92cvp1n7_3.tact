struct Level3 {
    number: Int;
    flag: Bool;
}

struct Level2 {
    nested: Level3;
    optionalFlag: Bool?;
}

struct Level1 {
    nested: Level2;
    text: String;
}

contract DeepContract {
    deepField: Level1;

    init() {
        self.deepField = Level1{
            nested: Level2{
                nested: Level3{number: 100, flag: false},
                optionalFlag: null
            },
            text: "Deep"
        };
    }
}