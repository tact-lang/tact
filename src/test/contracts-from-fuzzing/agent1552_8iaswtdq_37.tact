struct InnerA {
    f: Int;
}

contract ManyAssignments {
    a: Int;
    b: Bool;
    c: InnerA;
    d: Int?;
    e: Bool?;
    f: String;

    init() {
        self.a=1;
        self.b=false;
        self.c=InnerA{f:2};
        self.d=null;
        self.e=true;
        self.f="abc";
    }
}