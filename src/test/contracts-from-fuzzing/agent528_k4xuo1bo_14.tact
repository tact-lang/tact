struct B {
    flag: Bool;
}

struct A {
    val: Int;
    b: B;
}

struct C {
    a: A;
    s: String;
    opt_b: B?;
}

contract TestContract {
    c: C;
    init() {
        self.c = C{a:A{val:2, b:B{flag:true}}, s: "yo", opt_b:null};
    }
}