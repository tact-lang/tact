struct A {
    x: Int;
}

struct B {
    y: String;
}

struct C {
    z: Bool;
}

contract MultiStructVar {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{x: 1};
        self.b = B{y: "hi"};
        self.c = C{z: true};
    }
}