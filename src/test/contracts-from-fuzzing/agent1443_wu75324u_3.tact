struct A {
    b: B;
    c: C;
}

struct B {
    flag: Bool;
}

struct C {
    s: String;
    number: Int;
    optStr: String?;
}

contract MultiStructTest {
    data: A;

    init() {
        self.data = A{
            b: B{ flag: false },
            c: C{ s: "abc", number: -5, optStr: null },
        };
    }
}