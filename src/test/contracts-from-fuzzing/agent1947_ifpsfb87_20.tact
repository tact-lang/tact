struct A {
    f1: Int;
    f2: Bool?;
}

struct B {
    f3: Int?;
    f4: Bool;
}

contract TwoStructs {
    a: A;
    b: B;

    init() {
        self.a = A{ f1: 1, f2: null };
        self.b = B{ f3: null, f4: true };
    }
}