// struct with string, address, cell, slice, bool, int combinations
struct Varied {
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    b: Bool;
    i: Int;
    sb: String;
    ai: Int?;
    ab: Bool?;
}

contract TestContract {
    v: Varied;
    init() {
        self.v = Varied{
            s: "abc",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            b: true,
            i: 42,
            sb: "def",
            ai: null,
            ab: false
        };
    }
}