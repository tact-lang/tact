struct NestedMany {
    x1: Int;
    x2: Bool;
    y: Level2;
}

struct Level2 {
    a: Level3;
}

struct Level3 {
    b1: Int;
    b2: Bool;
}

contract Test19 {
    nm: NestedMany;
    init() {
        self.nm = NestedMany{
            x1: 1,
            x2: true,
            y: Level2{
                a: Level3{ b1:7, b2:false }
            }
        };
    }
}
