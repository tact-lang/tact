struct Level3 {
    data: String?;
    flag: Bool;
}

struct Level2 {
    inner: Level3;
    number: Int;
}

struct Level1 {
    wrapped: Level2;
    info: String;
}

contract NestedStructStorage {
    state: Level1;

    init() {
        self.state = Level1{
            wrapped: Level2{
                inner: Level3{
                    data: "deep",
                    flag: true
                },
                number: 42
            },
            info: "root"
        };
    }
}