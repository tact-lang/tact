struct Level3 {
    field: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract OptionalNestedTest {
    data: Level1;

    init() {
        self.data = Level1{inner: null};
    }
}