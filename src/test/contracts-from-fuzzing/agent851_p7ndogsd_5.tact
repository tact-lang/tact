struct MixTypes {
    a: Bool;
    b: Int;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: Int?;
    i: String?;
}

contract MixFieldsTest {
    mixed: MixTypes;

    init() {
        self.mixed = MixTypes{
            a: true,
            b: 123,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            g: null,
            h: null,
            i: null
        };
    }
}