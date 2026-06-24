struct Level3 {
    i3: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract TripleNested {
    store: Level1;

    init() {
        self.store = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    i3: 777
                }
            }
        };
    }
}