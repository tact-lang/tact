struct Mixed {
    num: Int;
    flag: Bool;
    addr: Address;
    cellData: Cell;
    text: String;
}

contract StorageTest {
    data: Mixed;

    init() {
        self.data = Mixed{
            num: 10,
            flag: false,
            addr: myAddress(),
            cellData: emptyCell(),
            text: "abc"
        };
    }
}