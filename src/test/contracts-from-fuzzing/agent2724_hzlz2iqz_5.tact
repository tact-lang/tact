struct MixTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MixedTypesContract {
    m: MixTypes;

    init() {
        self.m = MixTypes{
            a: 1,
            b: true,
            c: "ok",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
        };
    }
}