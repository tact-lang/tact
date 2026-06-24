// deep optional primitives and nested levels
struct DeepInner {
    lvl2: Level2?;
}

struct Level2 {
    some: Int?;
}

contract Test {
    val: DeepInner;
    init() {
        self.val = DeepInner{ lvl2: null };
    }
}
