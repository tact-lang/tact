struct First {
    a: Int;
    b: Int;
}

struct Second {
    c: Int;
    d: Int;
}

contract MultiStructsTest {
    x: First;
    y: Second;
    init() {
        self.x = First{ a: 1, b: 2 };
        self.y = Second{ c: 3, d: 4 };
    }
}