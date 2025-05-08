struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    a: A;
    s: String;
}

contract TestContract {
    a: A;
    b: B;

    init() {
        self.a = A{ f1: 1, f2: false };
        self.b = B{ a: self.a, s: "test" };
    }
}