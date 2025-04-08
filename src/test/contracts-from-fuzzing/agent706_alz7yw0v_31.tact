struct Nested {
    level1: Int;
    inner: Level2;
}

struct Level2 {
    level2: Int;
    inner2: Level3;
}

struct Level3 {
    level3: Int;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{
            level1:1,
            inner: Level2{
                level2:2,
                inner2: Level3{
                    level3:3,
                },
            }
        };
    }
}