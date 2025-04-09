struct Level3 {
    v: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract MultiNest {
    payload: Level1;

    init() {
        self.payload = Level1{
            nested: Level2{
                inner: Level3{
                    v: 123,
                }
            }
        };
    }
}
