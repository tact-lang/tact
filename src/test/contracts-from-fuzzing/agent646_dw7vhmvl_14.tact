struct OptionalInDeep {
    deep: LevelA;
}

struct LevelA {
    nested: LevelB;
}

struct LevelB {
    maybe: Int?;
}

contract OptDeepTest {
    data: OptionalInDeep;

    init() {
        self.data = OptionalInDeep{
            deep: LevelA{
                nested: LevelB{
                    maybe: null
                }
            }
        };
    }
}