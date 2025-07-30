struct Level3 {
    deep: Int;
    text: String;
}

struct Level2 {
    optDeep: Level3?;
    flag: Bool;
}

struct Level1 {
    sub: Level2;
    num: Int;
}

contract DeepNestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            sub: Level2{
                optDeep: null,
                flag: true
            },
            num: 999
        };
    }
}
