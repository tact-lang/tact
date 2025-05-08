contract ManyPersistent {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Slice;
    i: Cell;

    init() {
        self.a=1;
        self.b=true;
        self.c="z";
        self.d=null;
        self.e=null;
        self.f=null;
        self.g=myAddress();
        self.h=emptyCell().asSlice();
        self.i=emptyCell();
    }
}
