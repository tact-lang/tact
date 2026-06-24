contract MultiplePrimitives {
    foo: Int;
    bar: Bool;
    addr: Address;
    cellData: Cell;
    text: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.addr = myAddress();
        self.cellData = emptyCell();
        self.text = "Hello";
    }
}