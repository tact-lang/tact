struct Level2 {
    a: Int;
    b: String;
}

struct Level1 {
    c: Level2;
    d: Int?;
}

contract Test34 {
    l1: Level1;

    init() {
        self.l1 = Level1{
            c: Level2{ a:11, b:"hi" },
            d: null
        };
    }
}