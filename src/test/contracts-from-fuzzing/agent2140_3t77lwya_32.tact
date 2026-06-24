// deeply nested optional struct optionals within optionals
struct Leaf { val: Int; }
struct Level2 { leaf: Leaf?; }
struct Level1 { nested: Level2?; }

contract DeepOptionals {
    field: Level1?;
    init() {
        self.field = null;
    }
}
