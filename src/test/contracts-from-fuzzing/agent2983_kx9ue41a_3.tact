struct MixTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: Address?;
}

contract MixedFieldsTest {
    field: MixTypes;

    init() {
        self.field = MixTypes{
            a: 5,
            b: true,
            c: "world",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null
        };
    }
}