struct MixTypes {
    a: Bool;
    b: Int;
    c: String;
    d: Slice;
    e: Builder;
    f: Cell;
    g: Address;
}

contract MixTest {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            a: true,
            b: 123,
            c: "test",
            d: emptyCell().asSlice(),
            e: beginCell(),
            f: emptyCell(),
            g: myAddress()
        };
    }
}
