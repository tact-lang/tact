struct LevelTwo {
    i: Int;
    j: Bool;
}

struct LevelOne {
    nested: LevelTwo?;
}

contract DeepNestedOptional {
    val: LevelOne;

    init() {
        self.val = LevelOne{nested:null};
    }
}
