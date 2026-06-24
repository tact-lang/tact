struct Level3 {
    leaf: String;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    mid: Level2;
}

contract Test {
    data: Level1;

    init() {
        self.data = Level1{
            mid: Level2{
                inner: Level3{
                    leaf: "deep"
                }
            }
        };
    }
}
