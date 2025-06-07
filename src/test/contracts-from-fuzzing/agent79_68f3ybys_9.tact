struct ManyTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
}

contract TestContract {
    diverse: ManyTypes;

    init() {
        self.diverse = ManyTypes{
            intField: 1,
            boolField: true,
            stringField: "hello",
            addressField: myAddress(),
            cellField: emptyCell()
        };
    }
}