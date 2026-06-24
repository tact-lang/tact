struct A {
    x: Int;
}

struct B {
    y: Bool;
}

struct C {
    z: String;
}

contract MultipleVars {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{x:10};
        self.b = B{y:true};
        self.c = C{z:"hi"};
    }
}