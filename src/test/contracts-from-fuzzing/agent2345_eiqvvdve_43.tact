struct A {
    x: Int;
    y: Int?;
}

struct B {
    a: A?;
}

contract DefaultOptNested {
    b: B;

    init() {
        self.b = B{ a: null };
    }
}