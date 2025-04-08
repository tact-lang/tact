contract NestedContractFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    optionalStr: String?;
    optionalBool: Bool?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "c";
        self.d = emptyCell();
        self.e = myAddress();
        self.optionalStr = null;
        self.optionalBool = null;
    }
}