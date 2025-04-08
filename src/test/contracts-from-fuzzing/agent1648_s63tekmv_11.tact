struct Mix {
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    i: Int;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            b: true,
            s: "hi",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            i: 99
        };
    }
}