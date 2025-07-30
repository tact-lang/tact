struct Level3 {
    f: Int;
}

struct Level2 {
    a: Level3;
    b: Level3;
    c: Int;
}

struct Level1 {
    first: Level2;
    second: Level2;
    label: String;
}

contract MultiBranch {
    data: Level1;

    init() {
        self.data = Level1{
            first: Level2{
                a: Level3{f: 1},
                b: Level3{f: 2},
                c: 3,
            },
            second: Level2{
                a: Level3{f: 4},
                b: Level3{f: 5},
                c: 6,
            },
            label: "branches",
        };
    }
}