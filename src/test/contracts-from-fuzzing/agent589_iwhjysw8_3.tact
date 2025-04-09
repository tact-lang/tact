struct OptionalDeeply {
    maybeNest1: Level1?;
}

struct Level1 {
    maybeNest2: Level2?;
}

struct Level2 {
    maybeNest3: Level3?;
}

struct Level3 {
    val: Int?;
    str: String?;
}

contract OptNestedStructs {
    field: OptionalDeeply;

    init() {
        self.field = OptionalDeeply{
            maybeNest1: null,
        };
    }
}
