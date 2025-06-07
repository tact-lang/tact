struct Level4 {
    t: String;
}
struct Level3 {
    l4: Level4;
}
struct Level2 {
    l3: Level3;
}
struct Level1 {
    l2: Level2;
}

contract VeryDeepNesting {
    f: Level1;

    init() {
        self.f = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{ t: "deep" }
                }
            }
        };
    }
}