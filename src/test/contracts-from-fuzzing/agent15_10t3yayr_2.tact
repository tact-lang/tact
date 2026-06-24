struct Level2 {
    x: Int;
    y: String;
}

struct Level1 {
    inner: Level2;
    flag: Bool;
}

contract NestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            inner: Level2{
                x: 10,
                y: "hello",
            },
            flag: false,
        };
    }
}