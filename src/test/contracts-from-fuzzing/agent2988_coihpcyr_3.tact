struct DeeplyNested {
    s: String;
}

struct Level2 {
    dn: DeeplyNested;
}

struct Level1 {
    l2: Level2;
}

contract DeepNest {
    val: Level1;
    init() {
        self.val = Level1{
            l2: Level2{
                dn: DeeplyNested{
                    s: "deep"
                }
            }
        };
    }
}