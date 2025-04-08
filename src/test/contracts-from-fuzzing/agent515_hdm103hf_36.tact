// Large diverse contract with options/non-options and nested fields
struct C1 {
    a: Int?;
    b: Bool;
}

struct C2 {
    c: C1?;
    s: String;
}

contract ComplexDiverse {
    c1: C1;
    c2: C2;
    flag: Bool;
    optInt: Int?;
    str: String;

    init() {
        self.c1 = C1{a:null,b:true};
        self.c2 = C2{c:null,s:"hi"};
        self.flag = false;
        self.optInt = null;
        self.str = "s";
    }
}
