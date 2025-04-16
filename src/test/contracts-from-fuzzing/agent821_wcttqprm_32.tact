// test long sequence of optional bool persistent fields
contract TestManyOptBools {
    a: Bool? = null;
    b: Bool? = null;
    c: Bool? = null;
    d: Bool? = null;
    e: Bool? = null;
    f: Bool? = null;

    init() {
        self.a=true;
        self.b=false;
        self.c=true;
        self.d=false;
        self.e=true;
        self.f=false;
    }
}