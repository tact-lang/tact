struct OptionalDeep {
    l1: Level1?;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    num: Int?;
}

contract OptionalDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep {
            l1: Level1 {
                l2: Level2 {
                    num: null
                }
            }
        };
    }
}