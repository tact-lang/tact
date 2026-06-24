struct A {
    foo: Int;
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

contract NestTest {
    deep: C;

    init() {
        self.deep = C{
            baz: B{
                bar: A{
                    foo: 5,
                },
            },
        };
    }
}