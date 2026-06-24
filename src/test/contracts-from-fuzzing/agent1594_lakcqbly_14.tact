struct Top {
    field1: Int;
    field2: Int?;
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    a: Bool;
    b: String;
}

struct Nested2 {
    c: Cell;
    d: Slice;
    e: Address;
}

contract Test {
    data: Top;
    init() {
        self.data = Top{
            field1: 3,
            field2: null,
            nested1: Nested1{ a: true, b: "hello" },
            nested2: Nested2{ c: emptyCell(), d: emptyCell().asSlice(), e: myAddress() }
        };
    }
}