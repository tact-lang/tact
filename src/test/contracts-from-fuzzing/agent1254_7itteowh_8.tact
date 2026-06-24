struct Level3 {
    d: Int;
}

struct Level2 {
    c: Int;
    inner3: Level3;
}

struct Level1 {
    a: Int;
    inner2: Level2;
}

contract Deep3Nest {
    data: Level1;
    init() {
        self.data = Level1{
            a: 1,
            inner2: Level2{
                c: 2,
                inner3: Level3{
                    d: 3,
                },
            },
        };
    }
}