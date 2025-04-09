struct Level3 {
    detail: String;
    status: Bool;
}

struct Level2 {
    count: Int;
    info: Level3;
}

struct Level1 {
    value: Int;
    nested: Level2;
}

contract Nested3Levels {
    data: Level1;
    init() {
        self.data = Level1{
            value: 1,
            nested: Level2{
                count: 10,
                info: Level3{
                    detail: "deep",
                    status: true
                }
            }
        };
    }
}