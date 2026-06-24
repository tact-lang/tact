struct LevelThree {
    f1: Int;
}

struct LevelTwo {
    inner: LevelThree;
}

struct LevelOne {
    deeper: LevelTwo;
}

contract MultiLevelNested {
    val: LevelOne;
    init() {
        self.val = LevelOne{ deeper: LevelTwo{ inner: LevelThree{ f1: 42 } } };
    }
}