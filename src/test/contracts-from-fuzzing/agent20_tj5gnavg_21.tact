struct A {
    v: Int;
}

struct B {
    v: Bool;
}

struct C {
    v: String;
}

contract MixedNested {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ v: 1 };
        self.b = B{ v: true };
        self.c = C{ v: "str" };
    }
}