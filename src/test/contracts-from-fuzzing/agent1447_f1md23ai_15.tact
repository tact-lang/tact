struct A {
    foo: Int;
}

struct B {
    bar: Int;
    inner: A;
}

struct C {
    x: B;
    y: Int;
}

contract ChainNested {
    val: C;

    init() {
        self.val = C{
            x: B{
                bar: 1,
                inner: A{ foo: 2 }
            },
            y: 3
        };
    }
}