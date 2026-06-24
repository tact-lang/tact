struct MixTypes {
    a: Int;
    b: String;
    c: Bool;
    d: Slice;
    e: Cell;
    f: Address;
}

contract MixedFieldsTest {
    mix: MixTypes;

    init() {
        self.mix = MixTypes{
            a: 1,
            b: "test",
            c: true,
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
        };
    }
}