struct PrimitiveMix {
    i: Int;
    b: Bool;
    s: String;
    adr: Address;
    c: Cell;
}

contract MixTypes {
    data: PrimitiveMix;

    init() {
        self.data = PrimitiveMix{
            i: 42, b: true, s: "hello", adr: myAddress(), c: emptyCell()
        };
    }
}