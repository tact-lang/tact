struct Level3 {
    d: Int;
    e: Int?;
}

struct Level2 {
    c: Int;
    inner3: Level3;
}

struct Level1 {
    a: Int?;
    b: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            a: null,
            b: Level2{
                c: 7,
                inner3: Level3{
                    d: 42,
                    e: null
                }
            }
        };
    }
}