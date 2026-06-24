struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
    flag: Bool;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
    comment: String;
}

contract TestDeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            l2a: Level2{
                l3a: Level3{a: 1, b: true},
                l3b: Level3{a: 2, b: false},
                flag: true
            },
            l2b: Level2{
                l3a: Level3{a: 3, b: false},
                l3b: Level3{a: 4, b: true},
                flag: false
            },
            comment: "Nested"
        };
    }
}
