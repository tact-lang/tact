struct Mixed {
    num: Int;
    flag: Bool;
    data: Cell;
    addr: Address;
}

contract CoreComposite {
    storage: Mixed;

    init() {
        self.storage = Mixed{
            num: 123,
            flag: true,
            data: emptyCell(),
            addr: myAddress(),
        };
    }
}