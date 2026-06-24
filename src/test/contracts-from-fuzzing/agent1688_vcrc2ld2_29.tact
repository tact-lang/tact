contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Int;

    init() {
        self.a=1;
        self.b=true;
        self.c="x";
        self.d=myAddress();
        self.e=5;
        self.f=false;
        self.g="y";
        self.h=myAddress();
        self.i=9;
    }
}