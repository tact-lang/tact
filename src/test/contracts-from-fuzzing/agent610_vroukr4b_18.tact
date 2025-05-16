struct A { flag: Bool; }
struct B { num: Int; }
struct C { text: String; }

contract ManyFields {
    a: A;
    b: B;
    c: C;
    i: Int;
    s: String;
    b2: Bool;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;

    init() {
        self.a = A{flag:true};
        self.b = B{num:1};
        self.c = C{text:"hi"};
        self.i = 99;
        self.s = "S";
        self.b2 = false;
        self.optInt = null;
        self.optStr = null;
        self.optBool = null;
    }
}