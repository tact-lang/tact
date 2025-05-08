struct DeepString {
    level1: Level1Str;
}

struct Level1Str {
    level2: Level2Str;
}

struct Level2Str {
    message: String;
}

contract NestedStringStruct {
    data: DeepString;

    init() {
        self.data = DeepString{
            level1: Level1Str{
                level2: Level2Str{
                    message: "Hello",
                },
            },
        };
    }
}