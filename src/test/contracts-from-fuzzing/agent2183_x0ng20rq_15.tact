struct A {
    foo: Int;
}

struct B {
    a: A;
    bar: Bool;
}

contract NestedDefaults {
    b: B;

    init() {
        self.b = B{
            a: A{
                foo: 777
            },
            bar: false
        };
    }
}