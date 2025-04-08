struct Level1 {
    a: Int;
    b: Int;
}

struct Level2 {
    l1: Level1;
    c: Int;
}

struct Level3 {
    l2: Level2;
    d: Int;
}

contract Chain3 {
    val: Level3;

    init() {
        self.val = Level3{
            l2: Level2{
                l1: Level1{ a: 5, b: 6 },
                c: 7 },
            d: 8
        };
    }
}