struct VeryDeep {
    leaf: Int;
}

struct Level3 {
    next: VeryDeep;
    s: String;
}

struct Level2 {
    l3: Level3;
    b: Bool;
}

struct Level1 {
    l2: Level2;
    s: String;
}

contract UltraNested {
    top: Level1;
    init() {
        self.top = Level1{
            l2: Level2{
                l3: Level3{
                    next: VeryDeep{leaf:999},
                    s: "deep"
                },
                b: true
            },
            s: "start"
        };
    }
}