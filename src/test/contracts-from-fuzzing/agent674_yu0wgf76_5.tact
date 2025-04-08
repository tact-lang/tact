struct NestedOptional {
    inner: LevelTwo?;
}

struct LevelTwo {
    value: Int?;
}

contract TestContract {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            inner: LevelTwo{ value: null }
        };
    }
}