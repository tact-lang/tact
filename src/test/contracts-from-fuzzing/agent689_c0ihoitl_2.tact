struct Level3 {
    deep: Int;
}

struct Level2 {
    optInner: Level3?;
    str: String;
}

struct Level1 {
    flag: Bool;
    nested: Level2;
}

contract DeepNestedTest {
    state: Level1;

    init() {
        self.state = Level1{
            flag: false,
            nested: Level2{
                optInner: null,
                str: "test",
            },
        };
    }
}