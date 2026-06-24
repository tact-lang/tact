struct Deep {
    x: Int;
    y: Bool;
}

struct Nested {
    inner1: Int;
    inner2: Bool;
    deep: Deep;
}

contract NestedTest {
    data: Nested;

    init() {
        self.data = Nested{ inner1: 10, inner2: false, deep: Deep{ x: 5, y: true } };
    }
}