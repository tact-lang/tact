struct Level3 {
    f: Int;
    g: Bool;
}

struct Level2 {
    d: Int;
    e: Level3;
}

struct Level1 {
    a: Int;
    b: Bool;
    c: Level2;
}

contract NestedThree {
    data: Level1;
    init() {
        self.data = Level1{
            a: 1,
            b: true,
            c: Level2{
                d: 2,
                e: Level3{
                    f: 3,
                    g: false
                }
            }
        };
    }
}