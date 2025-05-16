struct MultiLevelNested {
    s1: LevelOne;
}

struct LevelOne {
    s2: LevelTwo;
}

struct LevelTwo {
    x: Int;
    y: Bool;
}

contract Test {
    val: MultiLevelNested;

    init() {
        self.val = MultiLevelNested{
            s1: LevelOne{
                s2: LevelTwo{ x: 5, y: true }
            }
        };
    }
}
