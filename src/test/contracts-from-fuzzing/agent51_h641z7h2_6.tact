struct B {
    x: Int = 1;
    y: Bool = false;
}

struct A {
    foo: B;
    bar: B;
    baz: B;
}

contract Test {
    a: A;
    init() {
        self.a = A{
            foo: B{},
            bar: B{},
            baz: B{}
        };
    }
}