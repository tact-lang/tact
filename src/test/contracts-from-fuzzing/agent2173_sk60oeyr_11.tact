struct A { intField: Int; boolField: Bool; stringField: String; addressField: Address; cellField: Cell; }

contract VariousStruct {
    s: A;

    init() {
        self.s = A{
            intField: 1,
            boolField: true,
            stringField: "abc",
            addressField: myAddress(),
            cellField: emptyCell()
        };
    }
}