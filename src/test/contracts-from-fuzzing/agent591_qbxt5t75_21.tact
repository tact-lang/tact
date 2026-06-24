struct ComposeDefault {
    arr: Nested;
}

struct Nested {
    x: Int = 5;
    y: Int = 12;
}

contract ComposeDefaultTest {
    s: ComposeDefault;

    init() {
        self.s = ComposeDefault{
            arr: Nested{}
        };
    }
}