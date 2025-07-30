struct Level3 {
    k: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract TestContract {
    nested: Level1?;

    init() {
        self.nested = Level1{
            inner: Level2{
                inner: Level3{
                    k: 999
                }
            }
        };
    }
}