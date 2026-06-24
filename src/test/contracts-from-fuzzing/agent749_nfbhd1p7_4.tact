struct Data {
    number: Int;
    active: Bool;
    dataStr: String;
    cellRef: Cell;
    optNumber: Int?;
    optBool: Bool?;
    optAddress: Address?;
}

contract TestContract {
    data: Data;

    init() {
        self.data = Data{
            number: 42,
            active: true,
            dataStr: "hi",
            cellRef: emptyCell(),
            optNumber: null,
            optBool: null,
            optAddress: null,
        };
    }

    receive() {
        let _ = self.data.number;
    }
}