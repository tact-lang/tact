struct Level2 {
    innerVal: Int;
    opt: Int?;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract DeepNestedTest {
    store: Level1;

    init() {
        self.store = Level1{
            nested: Level2{ innerVal: 1, opt: null },
            flag: true,
        };
    }
}