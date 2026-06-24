struct Primitives {
    i: Int;
    b: Bool;
    s: String;
    cl: Cell;
    sl: Slice;
    a: Address;
}

contract Holder {
    f: Primitives;

    init() {
        self.f = Primitives{
            i: 42,
            b: true,
            s: "hey",
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress()
        };
    }
}