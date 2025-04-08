struct A {
    f: B?;
}

struct B {
    x: Int;
}

contract CrossOptionalRefs {
    a: A;

    init() {
        self.a = A{f: B{x:5}};
    }
}