struct A {
    x: Int;
}

struct B {
    a: A;
    val: Int;
}

struct C {
    b: B;
    flag: Bool;
}

contract DeepFields {
    s: C;

    init() {
        self.s = C{
            b: B{
                a: A{x: 3},
                val: 42,
            },
            flag: false,
        };
    }
}