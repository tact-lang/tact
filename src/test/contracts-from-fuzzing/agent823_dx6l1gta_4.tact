struct Level3 {
    score: Int;
    description: String?;
}

struct Level2 {
    uid: Int;
    info: Level3?;
}

struct Level1 {
    id: Int;
    data: Level2;
    active: Bool;
}

contract DeepNestTest {
    s: Level1;

    init() {
        self.s = Level1{
            id: 100,
            data: Level2{
                uid: 200,
                info: Level3{
                    score: 300,
                    description: null
                }
            },
            active: true
        };
    }

    receive() {}
}