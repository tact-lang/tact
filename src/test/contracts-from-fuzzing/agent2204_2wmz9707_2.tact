struct A {
    i: Int;
    s: String;
    b: Bool;
    c: Cell;
    sl: Slice;
    addr: Address;
    optI: Int?;
    optS: String?;
    optB: Bool?;
    optC: Cell?;
    optSl: Slice?;
    optAddr: Address?;
}

contract LotsOfOptionals {
    value: A;
    init() {
        self.value = A{
            i: 1,
            s: "s",
            b: true,
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            optI: null,
            optS: null,
            optB: null,
            optC: null,
            optSl: null,
            optAddr: null,
        };
    }
}