struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    a: A;
    b: B;
}

contract MultiSameType {
    val: C;
    init() {
        self.val = C{
            a: A{ x:1 },
            b: B{ a: A{ x:2 } }
        };
    }
}