struct DeeplyNested {
    sub: Level1?;
}

struct Level1 {
    child: Level2?;
}

struct Level2 {
    leaf: Level3?;
}

struct Level3 {
    val: Int?;
}

contract OptionalDeep {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{ sub: null };
    }
}