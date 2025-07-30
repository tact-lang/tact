struct InnerStruct {
    a: Int;
    b: Bool;
}

contract MixedContract {
    ai: Int;
    flag: Bool;
    opt: Int?;
    str: String;
    cellData: Cell;
    addr: Address;
    nested: InnerStruct;

    init() {
        self.ai = 9;
        self.flag = true;
        self.opt = null;
        self.str = "test";
        self.cellData = emptyCell();
        self.addr = myAddress();
        self.nested = InnerStruct{ a: 11, b: false };
    }
}