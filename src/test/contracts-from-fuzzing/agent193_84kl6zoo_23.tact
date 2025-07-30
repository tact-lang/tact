struct NestedMultiLevel {
    a: Int;
    b: Level2;
}

struct Level2 {
    c: Int;
    d: Level3;
}

struct Level3 {
    e: Bool;
    f: Level4;
}

struct Level4 {
    g: String;
}

contract DeepChain {
    val: NestedMultiLevel;

    init() {
        self.val = NestedMultiLevel{
            a:1,
            b: Level2{
                c:2,
                d: Level3{
                    e:true,
                    f: Level4{ g:"done" }
                }
            }
        };
    }
}