// test nested struct with full assign, partial default
struct SI { x: Int; y: Int; }
struct SO { a: SI; b: SI; }

contract FullAssignNested {
    st: SO = SO {
        a: SI { x: 1, y: 2 },
        b: SI { x: 3, y: 4 }
    };
    init() {}
}