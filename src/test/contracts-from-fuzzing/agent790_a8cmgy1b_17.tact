struct A {
    i: Int;
}

struct B {
    str: String;
}

struct C {
    bl: Bool;
}

contract ManyStructTypes {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{i: 1};
        self.b = B{str: "x"};
        self.c = C{bl: true};
    }
}
