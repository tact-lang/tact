struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: Nested;
    num: Int;
    flag: Bool;
    text: String;
    data: Cell;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    slice: Slice;

    init() {
        self.nested = Nested{ a: 1, b: false };
        self.num = 42;
        self.flag = true;
        self.text = "test";
        self.data = emptyCell();
        self.addr = myAddress();
        self.optInt = null;
        self.optBool = true;
        self.slice = emptyCell().asSlice();
    }
}