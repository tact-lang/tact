struct Level2 {
    val: Int?;
}

struct Level1 {
    nested: Level2?;
}

contract NestedOptStruct {
    field: Level1?;

    init() {
        self.field = null;
    }
}