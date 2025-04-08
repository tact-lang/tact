struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract DeepNestedContract {
    val: C;

    init() {
        self.val = C{ c: B{ b: A{ a: 123 } } };
    }
}