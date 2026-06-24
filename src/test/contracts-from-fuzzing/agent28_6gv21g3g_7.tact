struct LargeOptionalDepth {
    lvl1: Level2?;
}

struct Level2 {
    lvl2: Level3?;
}

struct Level3 {
    lvl3: Level4?;
}

struct Level4 {
    val: Int;
}

contract OptionalDepthTest {
    data: LargeOptionalDepth;

    init() {
        self.data = LargeOptionalDepth{
            lvl1: Level2{
                lvl2: Level3{
                    lvl3: Level4{
                        val: 42
                    }
                }
            }
        };
    }
}