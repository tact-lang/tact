struct DeeplyNestedMix {
    level1: Level1;
}

struct Level1 {
    val1: Int = 1;
    level2: Level2;
}

struct Level2 {
    val2: Bool? = null;
    level3: Level3;
}

struct Level3 {
    val3: String;
}

contract DeepMixTest {
    data: DeeplyNestedMix;
    init() {
        self.data = DeeplyNestedMix{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        val3: "deep"
                    }
                }
            }
        };
    }
}