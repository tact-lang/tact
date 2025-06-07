struct X {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Bool?;
    h: Int?;
    i: String;
}

contract TestContract {
    val: X;

    init() {
        self.val = X{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: null,
            i: "bye"
        };
    }
}