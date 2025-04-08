contract MixedFields {
    count: Int as uint32;
    flag1: Bool;
    optVal: Int?;
    text: String;
    flag2: Bool?;
    code: Cell;
    maybeAddr: Address?;

    init() {
        self.count=42;
        self.flag1=true;
        self.optVal=null;
        self.text="ok";
        self.flag2=null;
        self.code=emptyCell();
        self.maybeAddr=null;
    }
}