struct A { x:Int; }
struct B { y:Int?; }
struct C { z:String; }

contract ManyStructFields {
    a:A;
    b:B;
    c:C;
    oa:A?;
    ob:B?;
    oc:C?;

    init() {
        self.a = A{x:10};
        self.b = B{y:null};
        self.c = C{z:"test"};
        self.oa = null;
        self.ob = null;
        self.oc = null;
    }
}