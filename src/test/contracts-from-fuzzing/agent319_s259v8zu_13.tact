struct Level2 {
    z: Bool?;
    y: String;
}

struct Level1 {
    x: Int;
    nested: Level2?;
}

contract TestContract {
    deeplyNestedOptional: Level1?;

    init() {
        self.deeplyNestedOptional = null;
    }
}