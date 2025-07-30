struct OptionalNestedLevel2 {
    inner: Level2?;
}

struct Level2 {
    value: Int?;
    text: String?;
}

contract OptionalNestedTest {
    data: OptionalNestedLevel2;

    init() {
        self.data = OptionalNestedLevel2{ inner: null };
    }
}