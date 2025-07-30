struct A {
    val: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract NestedFields {
    data: C;

    init() {
        self.data = C{ b: B{ a: A{ val: 42 } } };
    }
}