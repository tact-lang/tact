struct A {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract LotsOfVars {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    s: A;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "foo";
        self.d = null;
        self.e = true;
        self.s = A{a:2,b:true,c:"bar",d:null,e:null};
    }
}