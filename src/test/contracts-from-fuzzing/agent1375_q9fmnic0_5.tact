struct MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

contract DiverseFields {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell()
        };
    }
}