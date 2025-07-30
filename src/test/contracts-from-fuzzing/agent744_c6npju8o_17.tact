struct Blob {
    data1: String;
    data2: String;
    data3: String;
    num: Int;
    flag: Bool;
    addr: Address;
    cellStuff: Cell;
}

contract LargeStructField {
    blob: Blob;

    init() {
        self.blob = Blob{
            data1: "A",
            data2: "B",
            data3: "C",
            num: 999,
            flag: true,
            addr: myAddress(),
            cellStuff: emptyCell(),
        };
    }
}