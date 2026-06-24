struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    b: A;
    flag: Bool;
}

struct C {
    d: B;
    num: Int;
}

contract TestContract {
    obj: C;

    init() {
        self.obj = C{
            d: B{
                a: A{ x: 1, y: true },
                b: A{ x: 2, y: false },
                flag: true
            },
            num: 42
        };
    }
}