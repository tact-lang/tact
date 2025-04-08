// test large struct nesting 3 levels, mixing optionals
struct Level1 {
    f1: Int;
    f2: Int?;
}

struct Level2 {
    f1: Level1;
    f2: Level1?;
}

struct Level3 {
    f1: Level2;
    f2: Level2?;
}

contract Test {
    data: Level3;
    init() {
        self.data = Level3{
            f1: Level2{
                f1: Level1{f1: 1, f2: null},
                f2: null
            },
            f2: null
        };
    }
}