struct Level3 {
    msg: String;
    value: Int;
}

struct Level2 {
    deep: Level3?;
}

struct Level1 {
    inner: Level2;
}

contract OptNestedTest {
    x: Level1;

    init() {
        self.x = Level1 {
            inner: Level2 {
                deep: Level3 { msg: "test", value: 123 }
            }
        };
    }
}