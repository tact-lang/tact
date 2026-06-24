contract MixedTypesDefaults {
    number: Int = -7;
    flag: Bool = true;
    text: String = "abc";
    addr: Address; // no initializer
    cellVal: Cell; // no initializer

    init() {
        self.addr = myAddress();
        self.cellVal = emptyCell();
    }

    receive() {
        let _ = self.text;
    }
}