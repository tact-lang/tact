struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
}

contract MixTypesTest {
    mixed: MixTypes;

    init() {
        self.mixed = MixTypes{
            i: 1, b: true, s: "hello", c: emptyCell(), addr: myAddress()
        };
    }
}