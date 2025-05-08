struct Level3 {
    i: Int;
    b: Bool;
    s: String;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract ComplexNested {
    data: Level1;

    init() {
        self.data = Level1{
            l2a: Level2{
                l3a: Level3{i: 1, b: true, s: "a"},
                l3b: Level3{i: 2, b: false, s: "b"},
            },
            l2b: Level2{
                l3a: Level3{i: 3, b: true, s: "c"},
                l3b: Level3{i: 4, b: false, s: "d"},
            }
        };
    }
}