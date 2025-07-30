struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sl: Slice;
    optI: Int?;
    optStr: String?;
}

contract MixedStructStorage3 {
    data: MixTypes;
    init() {
        self.data = MixTypes{
            i: 42,
            b: true,
            s: "s",
            c: emptyCell(),
            a: myAddress(),
            sl: emptyCell().asSlice(),
            optI: null,
            optStr: null,
        };
    }
}