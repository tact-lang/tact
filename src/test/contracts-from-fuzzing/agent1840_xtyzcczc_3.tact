struct A {
    a1: Int;
}

struct B {
    b1: A;
    b2: Int?;
}

struct C {
    c1: B;
    c2: Bool;
    c3: String;
}

contract WithDeepStruct {
    myvar: C;

    init() {
        self.myvar = C{
            c1: B{ b1: A{ a1:7 }, b2:null },
            c2: true,
            c3: "str"
        };
    }
}