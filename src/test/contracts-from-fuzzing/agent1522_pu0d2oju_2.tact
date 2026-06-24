struct Simple {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
}

contract ManyFields {
    s: Simple;
    num: Int;
    flag: Bool;
    text: String;
    coins: Int as coins;
    slice: Slice;
    builder: Builder;
    addr: Address;
    data: Cell;
    optInt: Int?;

    init() {
        self.s = Simple{
            a: 1,
            b: true,
            c: null,
            d: emptyCell(),
        };
        self.num = 123;
        self.flag = false;
        self.text = "abc";
        self.coins = 1000;
        self.slice = emptyCell().asSlice();
        self.builder = beginCell();
        self.addr = myAddress();
        self.data = emptyCell();
        self.optInt = null;
    }
}