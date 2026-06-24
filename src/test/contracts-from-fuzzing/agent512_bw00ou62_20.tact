struct OptionalDeep {
    level1: OptionalLevel1?;
}

struct OptionalLevel1 {
    level2: OptionalLevel2?;
}

struct OptionalLevel2 {
    level3: OptionalLevel3?;
}

struct OptionalLevel3 {
    val: Int?;
}

contract OptionalDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            level1: OptionalLevel1{
                level2: OptionalLevel2{
                    level3: OptionalLevel3{
                        val: null
                    }
                }
            }
        };
    }
}
