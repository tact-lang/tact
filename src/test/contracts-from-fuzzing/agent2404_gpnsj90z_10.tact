struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    af: A;
    flag: Bool;
}

struct C {
    af: A;
    bf: B;
    optb: B?;
    str: String;
}

contract ComplexContract {
    storage: C;

    init() {
        self.storage = C{
            af: A{f1:0,f2:true},
            bf: B{af:A{f1:1,f2:false},flag:true},
            optb: null,
            str: "hi"
        };
    }
}