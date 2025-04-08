struct Level1 {
    value1: Int;
}

struct Level2 {
    inner: Level1;
}

struct Level3 {
    inner: Level2;
}

contract MultiNested {
    data: Level3;

    init() {
        self.data = Level3{
            inner: Level2{
                inner: Level1{
                    value1: 100
                }
            }
        };
    }
}
