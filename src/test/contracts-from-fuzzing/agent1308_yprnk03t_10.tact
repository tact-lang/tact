struct NestedMix {
    level1: Int;
    level2: Level2;
    level3: Level3?;
}

struct Level2 {
    val: Bool?;
    sub: Level3;
}

struct Level3 {
    inner: Int?;
}

contract TestContract {
    data: NestedMix;

    init() {
        self.data = NestedMix {
            level1: 0,
            level2: Level2 { val: null, sub: Level3 { inner: null } },
            level3: null
        };
    }
}