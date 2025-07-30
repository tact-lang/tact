contract TestManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bl: Builder;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;

    init() {
        self.i = 3;
        self.b = true;
        self.s = "ok";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bl = beginCell();
        self.addr = myAddress();
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optCell = null;
        self.optSlice = null;
        self.optBuilder = null;
    }
}