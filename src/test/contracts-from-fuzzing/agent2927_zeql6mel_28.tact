struct Level2Opt {
    val: Int?;
}

struct Level1Opt {
    child: Level2Opt?;
}

contract OptionalNestedStructField {
    field: Level1Opt;

    init() {
        self.field = Level1Opt{ child: null };
    }
}