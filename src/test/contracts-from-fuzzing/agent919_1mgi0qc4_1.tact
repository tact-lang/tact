struct NestedOptional {
    inner: Int?;
}

struct Level2 {
    nested: NestedOptional?;
}

contract DeepOptionalTest {
    val: Level2?;

    init() {
        self.val = null;
    }
}