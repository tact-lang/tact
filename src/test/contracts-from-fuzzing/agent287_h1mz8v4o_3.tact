struct S {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract TestContract {
    val: S;

    init() {
        self.val = S{
            i: 1,
            b: true,
            s: "abc",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
            optInt: null,
            optStr: null,
            optBool: false,
        };
    }
}