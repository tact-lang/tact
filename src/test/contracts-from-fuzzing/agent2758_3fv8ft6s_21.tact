struct A {
    i: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
}

contract TestContract {
    val: B;

    init() {
        self.val = B{
            a1: A{ i: 11 },
            a2: A{ i: 22 },
            a3: A{ i: 33 }
        };
    }
}