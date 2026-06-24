contract ManyMixedFields {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
    e: Slice?;
    f: Bool?;
    g: String;
    h: Int?;
    i: Bool;

    init() {
        self.a=1;
        self.b=true;
        self.c="ok";
        self.d=emptyCell();
        self.e=emptyCell().asSlice();
        self.f=null;
        self.g="test";
        self.h=null;
        self.i=false;
    }
}