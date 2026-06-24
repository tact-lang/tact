struct FlatMany {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
}

contract MultiVars {
    x: Int;
    y: Bool;
    z: String;
    addr: Address;
    cel: Cell;
    s: FlatMany;
    opt: String?;
    optNum: Int?;
    init() {
        self.x = 1;
        self.y = true;
        self.z = "abc";
        self.addr = myAddress();
        self.cel = emptyCell();
        self.s = FlatMany{a:2,b:"def",c:false,d:myAddress(),e:emptyCell()};
        self.opt = null;
        self.optNum = null;
    }
}