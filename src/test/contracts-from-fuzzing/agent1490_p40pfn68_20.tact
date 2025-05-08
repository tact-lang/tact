struct DeepInner {
    v: Int;
}

struct LevelTwo {
    d: DeepInner;
}

struct LevelOne {
    l2: LevelTwo;
}

contract CascadingNesting {
    field: LevelOne;

    init() {
        self.field = LevelOne{ l2: LevelTwo{ d: DeepInner{ v:5 } } };
    }
}