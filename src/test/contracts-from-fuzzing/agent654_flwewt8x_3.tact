struct Level2 {
    x: Int;
    y: String;
}

struct Level1 {
    nested: Level2;
    maybeNested: Level2?;
}

contract TestContract {
    deeplyNested: Level1;
    init() {
        self.deeplyNested = Level1{
            nested: Level2{ x: 1, y: "one" },
            maybeNested: null
        };
    }
}