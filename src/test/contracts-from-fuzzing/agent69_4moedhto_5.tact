struct OptionalDeep {
    s: LevelOne?;
}

struct LevelOne {
    s: LevelTwo?;
}

struct LevelTwo {
    n: Int?;
}

contract OptionalDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            s: LevelOne{
                s: LevelTwo{
                    n: null
                }
            }
        };
    }
}