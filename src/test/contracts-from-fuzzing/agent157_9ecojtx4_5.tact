struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
}

contract MixTypesTest {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            i: 1,
            b: false,
            s: "hi",
            addr: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}
