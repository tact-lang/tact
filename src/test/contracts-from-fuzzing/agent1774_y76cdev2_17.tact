struct Struct1 { a: Int; }
struct Struct2 { a: Int; }
struct Struct3 { a: Int; }
struct Struct4 { a: Int; }
struct Struct5 { a: Int; }

contract ManyStructs {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;
    s4: Struct4;
    s5: Struct5;

    init() {
        self.s1 = Struct1{a:1};
        self.s2 = Struct2{a:2};
        self.s3 = Struct3{a:3};
        self.s4 = Struct4{a:4};
        self.s5 = Struct5{a:5};
    }
}
