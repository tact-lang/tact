struct Combo {
    a: Int;
    b: Bool = false;
    c: String?;
    d: Slice;
}

contract TestContract {
    field: Combo;

    init() {
        self.field = Combo{
            a: 5,
            d: emptyCell().asSlice(),
            c: null
        };
    }

    receive() {
        self.field;
    }
}