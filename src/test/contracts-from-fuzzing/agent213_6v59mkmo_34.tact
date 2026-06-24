contract HasPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;

    init() {
        self.i=1;
        self.b=true;
        self.s="x";
        self.a=myAddress();
        self.c=emptyCell();
    }
}