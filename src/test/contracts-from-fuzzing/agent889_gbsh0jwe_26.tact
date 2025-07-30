contract TupleLikeStorage {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
    e: Address;
    f: Int?;
    g: Bool;
    h: String?;
    i: Slice;
    j: Address?;

    init() {
        self.a=1;self.b=null;self.c="t";self.d=null;self.e=myAddress();
        self.f=null;self.g=true;self.h=null;self.i=emptyCell().asSlice();self.j=null;
    }
}