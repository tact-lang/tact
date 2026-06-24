struct NestedDeep {
    level1: Int;
    opt: Level2?;
}

struct Level2 {
    level2: Int;
    opt: Level3?;
}

struct Level3 {
    level3: Int;
    opt: Level4?;
}

struct Level4 {
    level4: Int;
}

contract NestedDeepTest {
    data: NestedDeep;

    init() {
        self.data = NestedDeep{
            level1: 1,
            opt: Level2{
                level2: 2,
                opt: Level3{
                    level3: 3,
                    opt: Level4{level4:4},
                },
            },
        };
    }
}