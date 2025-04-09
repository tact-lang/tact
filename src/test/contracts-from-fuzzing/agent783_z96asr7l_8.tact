struct A {
    x: Int;
}

struct B {
    a: A;
    flag: Bool;
}

struct C {
    b: B;
    num: Int;
    optStr: String?;
}

contract WideNestedTest {
    big: C;

    init() {
        self.big = C{
            b: B{ a: A{ x: 7 }, flag: true },
            num: 99,
            optStr: null
        };
    }
}