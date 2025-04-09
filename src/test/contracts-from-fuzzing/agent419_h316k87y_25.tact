// struct with nested Cell, Slice and optional versions
struct Nested {
    c: Cell;
    s: Slice;
    oc: Cell?;
    os: Slice?;
}

contract Cells {
    f: Nested;

    init() {
        self.f = Nested{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            oc: null,
            os: null
        };
    }
}