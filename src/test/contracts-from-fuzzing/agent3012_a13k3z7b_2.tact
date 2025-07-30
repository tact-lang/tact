struct Level2 {
    a: Int;
    b: Bool;
}

struct Level1 {
    x: Level2;
    y: Int;
}

contract DoubleNestedTest {
    data: Level1;

    init() {
        self.data = Level1{
            x: Level2{ a: 5, b: false },
            y: 99
        };
    }
}