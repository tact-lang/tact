struct A {
    v: Int?;
}

struct B {
    s: String?;
}

contract MixedNestedOpt {
    a: A?;
    b: B;

    init() {
        self.a = null;
        self.b = B{ s: null };
    }
}
