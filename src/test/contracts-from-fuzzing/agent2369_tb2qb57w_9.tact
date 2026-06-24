struct WideMix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optC: Cell?;
    optSl: Slice?;
    optAddr: Address?;
}

contract MixTest {
    val: WideMix;

    init() {
        self.val = WideMix{
            i: 1,
            b: true,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            optI: null,
            optB: null,
            optS: null,
            optC: null,
            optSl: null,
            optAddr: null
        };
    }
}