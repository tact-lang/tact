struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
}

contract MixedFields {
    st: MixTypes;

    init() {
        self.st = MixTypes{
            i: 7,
            b: true,
            s: "hello",
            a: myAddress(),
            c: emptyCell()
        };
    }
}
