struct Level3 {
    flag: Bool;
    name: String;
}

struct Level2 {
    id: Int;
    info: Level3;
}

struct Level1 {
    count: Int;
    details: Level2;
}

contract DeepNestTest {
    record: Level1;

    init() {
        self.record = Level1{
            count: 5,
            details: Level2{
                id: 7,
                info: Level3{
                    flag: true,
                    name: "deep",
                },
            },
        };
    }
}