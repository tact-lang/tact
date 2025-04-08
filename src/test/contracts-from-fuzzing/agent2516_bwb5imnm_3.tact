struct Level3 {
    e: Int;
    f: Int?;
}

struct Level2 {
    c: Level3;
    d: Int;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            a: 7,
            b: Level2{
                c: Level3{
                    e: 1,
                    f: null,
                },
                d: 5,
            },
        };
    }
}