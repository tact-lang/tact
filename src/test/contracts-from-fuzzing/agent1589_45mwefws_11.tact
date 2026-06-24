struct A {
    value: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepEmbed {
    field: C;

    init() {
        self.field = C{ b:B{ a:A{ value:42 } } };
    }
}