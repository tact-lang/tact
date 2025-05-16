struct Level3 {
    val3: Int?;
}

struct Level2 {
    val2: Bool;
    nxt: Level3;
}

struct Level1 {
    val1: String;
    nxt: Level2;
}

contract MultiDepth {
    data: Level1;

    init() {
        self.data = Level1{
            val1: "deep",
            nxt: Level2{
                val2: false,
                nxt: Level3{
                    val3: null,
                },
            },
        };
    }
}