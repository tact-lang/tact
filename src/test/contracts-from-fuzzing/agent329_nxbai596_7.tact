struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
}

contract TestContract {
    mixed: MixTypes;
    init() {
        self.mixed = MixTypes{
            i: 5,
            b: true,
            s: "hello",
            c: emptyCell(),
            a: myAddress(),
        };
    }
}