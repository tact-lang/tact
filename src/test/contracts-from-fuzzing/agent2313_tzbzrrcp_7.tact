struct MixPrimitives {
    num: Int;
    flag: Bool;
    addr: Address;
    str: String;
    cl: Cell;
    sl: Slice;
}

contract TestContract {
    mix: MixPrimitives;

    init() {
        self.mix = MixPrimitives{
            num: 10,
            flag: true,
            addr: myAddress(),
            str: "hi",
            cl: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}