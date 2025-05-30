struct NestedOptional {
    x: Int?;
    y: LevelTwo?;
}

struct LevelTwo {
    z: Int?;
}

contract OptTest {
    val: NestedOptional;
    init() {
        self.val = NestedOptional{
            x: null,
            y: null
        };
    }
}