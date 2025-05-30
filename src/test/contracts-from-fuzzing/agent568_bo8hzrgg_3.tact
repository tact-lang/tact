struct A {
    x: Int;
    y: Bool;
}

struct B {
    a1: A;
    a2: A;
    flag: Bool;
}

struct C {
    b: B;
    a: A;
}

contract MultiNested {
    data: C;

    init() {
        self.data = C{
            b: B{
                a1: A{ x: 1, y: true },
                a2: A{ x: 2, y: false },
                flag: true
            },
            a: A{ x: 3, y: false }
        };
    }
}