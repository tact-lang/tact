struct Level3 {
    content: String;
}

struct Level2 {
    lvl3: Level3;
    score: Int;
}

struct Level1 {
    lvl2: Level2;
    active: Bool;
}

contract TripleNest {
    data: Level1;

    init() {
        self.data = Level1{
            lvl2: Level2{
                lvl3: Level3{content: "deep"},
                score: 777
            },
            active: true
        };
    }
}
