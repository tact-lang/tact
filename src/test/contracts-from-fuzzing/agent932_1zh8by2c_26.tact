// Verify trailing commas unsupported in contract fields, now without them
contract TrailingOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Address?;
    g: Cell?;
    h: Slice?;
    i: String?;

    init() {
        self.a=null; self.b=null; self.c=5;
        self.d=true; self.e=null; self.f=myAddress();
        self.g=emptyCell(); self.h=emptyCell().asSlice(); self.i="t";
    }
}