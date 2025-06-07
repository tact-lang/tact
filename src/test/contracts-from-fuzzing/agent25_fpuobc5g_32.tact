// contract with an empty init and many fields
contract Test {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
    init() {
        self.a=1;
        self.b=true;
        self.c="c";
        self.d=emptyCell();
        self.e=myAddress();
        self.f=null;
        self.g=null;
        self.h=null;
        self.i=null;
        self.j=null;
    }
}