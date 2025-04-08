struct MixedBig {
    addr: Address;
    note: String;
    blob: Cell;
}

contract MixedPersist {
    data: MixedBig;

    init() {
        self.data = MixedBig{
            addr: myAddress(),
            note: "TestNote",
            blob: emptyCell()
        };
    }
}
