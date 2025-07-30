struct Param1 { a: Int; }
struct Param2 { b: Int; }
struct Param3 { c: Int; }
struct Param4 { d: Int; }
struct Param5 { e: Int; }

contract ManyStructs {
    s1: Param1;
    s2: Param2;
    s3: Param3;
    s4: Param4;
    s5: Param5;

    init() {
        self.s1 = Param1{a:1};
        self.s2 = Param2{b:2};
        self.s3 = Param3{c:3};
        self.s4 = Param4{d:4};
        self.s5 = Param5{e:5};
    }
}
