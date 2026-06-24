struct Level3 {
    alpha: Int;
    beta: Bool?;
}

struct Level2 {
    m: Level3;
    n: Int?;
}

struct Level1 {
    a: Level2;
    b: Bool;
    c: Int?;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            a: Level2{
                m: Level3{
                    alpha: 77,
                    beta: null
                },
                n: 1000
            },
            b: true,
            c: null
        };
    }
}