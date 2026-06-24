struct A {
    i: Int;
}

struct B {
    s: String;
}

struct C {
    f: Bool;
}

contract ManyNestedStructs {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ i: 123 };
        self.b = B{ s: "hi" };
        self.c = C{ f: true };
    }
}