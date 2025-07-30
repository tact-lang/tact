struct Level3 {
    val: Int;
    flag: Bool;
}

struct Level2 {
    nested: Level3;
    text: String?;
}

struct Level1 {
    mid: Level2;
}

contract TripleNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            mid: Level2{
                nested: Level3{
                    val: 123,
                    flag: false,
                },
                text: "hello",
            },
        };
    }
}