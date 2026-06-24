struct LevelThree {
    d: Int?;
    e: String;
}

struct LevelTwo {
    b: Int;
    c: LevelThree;
}

struct LevelOne {
    a: Bool;
    nested: LevelTwo;
}

contract MultiLevelNested {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            a: true,
            nested: LevelTwo{
                b: 5,
                c: LevelThree{
                    d: null,
                    e: "hello"
                }
            }
        };
    }
}