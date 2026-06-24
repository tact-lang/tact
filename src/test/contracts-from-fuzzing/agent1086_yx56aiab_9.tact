struct MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

contract MixedContract {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            a: 1,
            b: true,
            c: "test",
            d: myAddress(),
            e: emptyCell()
        };
    }
}