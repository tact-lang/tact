struct BigNested {
    a: Nested1;
    b: Nested2;
    c: Nested3;
}

struct Nested1 {
    x: Int;
    y: Int;
}

struct Nested2 {
    m: String;
    n: Bool;
}

struct Nested3 {
    p: Address;
    q: Cell;
}

contract BigNestedTest {
    data: BigNested;
    init() {
        self.data = BigNested{
            a: Nested1{ x: 1, y: 2 },
            b: Nested2{ m: "hi", n: false },
            c: Nested3{ p: myAddress(), q: emptyCell() }
        };
    }
}
