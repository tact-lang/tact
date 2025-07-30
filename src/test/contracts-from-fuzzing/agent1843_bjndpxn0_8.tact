struct Big {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

contract LargeStructTest {
    payload: Big;

    init() {
        self.payload = Big{
            i: 1, b: true, s: "hi", c: emptyCell(),
            sl: emptyCell().asSlice(), a: myAddress(),
            optI: null, optS: null, optB: null
        };
    }
}
