struct NestedWide {
    level1: Level1;
}

struct Level1 {
    level2_1: Inner;
    level2_2: Inner;
    level2_3: Inner;
}

struct Inner {
    x: Int;
    y: String;
    z: Bool?;
}

contract NestedWideTest {
    n: NestedWide;

    init() {
        self.n = NestedWide{
            level1: Level1{
                level2_1: Inner{ x:1, y:"a", z:null },
                level2_2: Inner{ x:2, y:"b", z:true },
                level2_3: Inner{ x:3, y:"c", z:false }
            }
        };
    }
}