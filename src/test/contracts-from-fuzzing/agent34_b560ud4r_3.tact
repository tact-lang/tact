struct LevelTwo {
    flag: Bool;
    text: String;
}

struct LevelOne {
    count: Int;
    sub: LevelTwo;
}

contract TestContract {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{
            count: 7,
            sub: LevelTwo{
                flag: true,
                text: "Hi",
            },
        };
    }
}