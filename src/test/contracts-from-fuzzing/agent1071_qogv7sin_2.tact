struct Level3 {
    val: Int;
    flag: Bool;
}

struct Level2 {
    nested: Level3;
    text: String;
    optFlag: Bool?;
}

struct Level1 {
    nested: Level2;
    count: Int;
}

contract NestedStructStorage {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    val: 42,
                    flag: true,
                },
                text: "hi",
                optFlag: null,
            },
            count: 7,
        };
    }
}