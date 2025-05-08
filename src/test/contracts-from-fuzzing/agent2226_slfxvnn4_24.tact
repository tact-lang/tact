struct Complex {
    intVal: Int as int128;
    strVal: String;
    boolVal: Bool;
    optInt: Int?;
    optStr: String?;
    addressVal: Address;
    cellVal: Cell;
}

contract MixStorage {
    c: Complex;
    init() {
        self.c = Complex{
            intVal: 12345,
            strVal: "hi",
            boolVal: true,
            optInt: null,
            optStr: "foo",
            addressVal: myAddress(),
            cellVal: emptyCell()
        };
    }
}