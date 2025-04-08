struct Level3 {
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    count: Int?;
}

struct Level1 {
    l2: Level2;
    comment: String;
}

contract TripleNested {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{flag: false},
                count: null
            },
            comment: "deep"
        };
    }
}
