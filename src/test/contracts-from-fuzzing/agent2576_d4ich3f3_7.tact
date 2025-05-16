struct Level3 {
    k: Int;
    txt: String;
}

struct Level2 {
    x: Level3;
    y: Level3;
}

struct Level1 {
    aa: Level2;
    bb: Level2;
}

contract DeeplyNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            aa: Level2{
                x: Level3{k:1, txt:"a"},
                y: Level3{k:2, txt:"b"}
            },
            bb: Level2{
                x: Level3{k:3, txt:"c"},
                y: Level3{k:4, txt:"d"}
            }
        };
    }
}