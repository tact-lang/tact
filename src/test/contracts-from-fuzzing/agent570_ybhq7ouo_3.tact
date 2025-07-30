struct Level3 {
    number: Int?;
    text: String;
}

struct Level2 {
    active: Bool;
    deep: Level3;
}

struct Level1 {
    name: String?;
    nested: Level2;
}

contract NestTest {
    record: Level1;

    init() {
        self.record = Level1{
            name: null,
            nested: Level2{
                active: true,
                deep: Level3{
                    number: null,
                    text: "deep"
                }
            }
        };
    }

    receive() {}
}