struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    mid: Level2;
}

contract Test {
    saved: Level1;

    init() {
        self.saved = Level1{
            mid: Level2{
                inner: Level3{
                    val: 99,
                },
            },
        };
    }
}