struct A {
    v1: Int;
}

struct B {
    v2: Bool;
    a: A;
}

struct C {
    b: B;
    s: String;
    opt: Bool?;
}

contract Nesting {
    c: C;
    
    init() {
        self.c = C{
            b: B{ v2: true, a: A{v1: 7} },
            s: "world",
            opt: null
        };
    }
}