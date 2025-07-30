struct Level3 {
    val: Int;
    opt: Int?;
}

struct Level2 {
    lv3: Level3;
    optLv3: Level3?;
}

struct Level1 {
    lv2: Level2;
    optLv2: Level2?;
}

contract MultiNestedStructs {
    nested: Level1;

    init() {
        self.nested = Level1{
            lv2: Level2{
                lv3: Level3{ val: 7, opt: null },
                optLv3: null
            },
            optLv2: null
        };
    }
}
