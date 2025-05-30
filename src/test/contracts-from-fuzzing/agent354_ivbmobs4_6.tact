struct MixTypes {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: Int?;
    i: String?;
}

contract MixedFieldsTest {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            a: 1,
            b: "str",
            c: true,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: false,
            h: null,
            i: null
        };
    }
}