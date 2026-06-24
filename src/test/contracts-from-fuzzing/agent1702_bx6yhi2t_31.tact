struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    a: A;
    b: B;
}

contract OptionalOverlap {
    val: C?;

    init() {
        self.val = C{ a: A{a:1}, b: B{b:2} };
    }
}
