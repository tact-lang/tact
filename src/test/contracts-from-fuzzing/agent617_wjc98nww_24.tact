contract MixTypes {
    x: Int;
    y: Bool;
    addr: Address;
    str: String;
    s: Slice;
    c: Cell;
    
    init() {
        self.x=1; self.y=true; self.addr=myAddress(); self.str="hi";
        self.s=emptyCell().asSlice(); self.c=emptyCell();
    }
}
