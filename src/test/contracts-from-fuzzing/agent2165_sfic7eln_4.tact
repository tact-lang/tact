struct Level3 {
    c: String;
}

struct Level2 {
    b: Bool;
    l3: Level3;
}

struct Level1 {
    a: Int;
    l2: Level2;
}

contract Test4 {
    stuff: Level1;

    init() {
        self.stuff = Level1{
            a: 7,
            l2: Level2{
                b: true,
                l3: Level3{
                    c: "deepest"
                }
            }
        };
    }
}