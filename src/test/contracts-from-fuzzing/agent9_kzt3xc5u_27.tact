struct W {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    si: String?;
    ai: Address?;
    ci: Cell?;
    sli: Slice?;
    bi: Bool?;
    ii: Int?;
}

contract AllTypes {
    val: W;

    init() {
        self.val = W{
            i: 1,
            b: true,
            s: "s",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            si: null,
            ai: null,
            ci: null,
            sli: null,
            bi: null,
            ii: null
        };
    }
}