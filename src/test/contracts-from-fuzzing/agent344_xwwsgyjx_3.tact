struct MixTypes {
    i: Int;
    s: String;
    b: Bool;
    addr: Address;
    cl: Cell;
    sl: Slice;
    bl: Builder;
}

contract AllPrimitives {
    mix: MixTypes;

    init() {
        self.mix = MixTypes{
            i: 123,
            s: "hi",
            b: true,
            addr: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell(),
        };
    }
}