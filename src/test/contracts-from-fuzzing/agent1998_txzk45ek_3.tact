struct DeepNested {
    a: Int;
    b: Bool;
    c: String;
}

struct LevelTwo {
    nested: DeepNested;
    flag: Bool;
}

struct LevelOne {
    mid: LevelTwo;
    num: Int;
}

contract DeepNestedContract {
    x: LevelOne;

    init() {
        self.x = LevelOne{
            mid: LevelTwo{
                nested: DeepNested{
                    a: 5,
                    b: true,
                    c: "hi"
                },
                flag: false
            },
            num: 100
        };
    }
}