// Struct field order test with various scalar types
struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed {
            i: 12,
            b: true,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}