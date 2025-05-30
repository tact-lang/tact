struct Level2 {
    x: Int = 7;
    flag: Bool = false;
}

struct Level1 {
    value: Int = 123;
    nested: Level2;
}

contract DeepNestedTest {
    info: Level1;

    init() {
        self.info = Level1{
            nested: Level2{
                x: 999,
                flag: true
            }
        };
    }
}