struct Combo {
    s: Slice?;
    c: Cell?;
    str: String?;
}

contract Test {
    data: Combo;

    init() {
        self.data = Combo{
            s: null,
            c: null,
            str: null
        };
    }
}
