struct Level3 {
    val: Int;
}

struct Level2 {
    foo: Level3?;
}

struct Level1 {
    bar: Level2?;
}

contract NestedOptionStructs {
    nested: Level1?;

    init() {
        self.nested = null;
    }
}