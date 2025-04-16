struct A {
    a: Int;
}

struct B {
    b: Bool;
}

struct C {
    c: String;
}

contract MixOrder {
    int1: Int;
    structA: A;
    bool1: Bool;
    structB: B;
    int2: Int;
    structC: C;
    bool2: Bool;
    str: String;

    init() {
        self.int1=1;
        self.structA=A{a:2};
        self.bool1=true;
        self.structB=B{b:false};
        self.int2=3;
        self.structC=C{c:"hi"};
        self.bool2=false;
        self.str="h";
    }

    receive() {
        let _ = self.int1+self.int2;
    }
}
