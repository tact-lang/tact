struct Mixed {
    num: Int;
    flag: Bool;
    addr: Address;
    cellData: Cell;
    text: String;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            num: 7,
            flag: true,
            addr: myAddress(),
            cellData: emptyCell(),
            text: "hi"
        };
    }
}