struct A {
    f1: Int;
}

struct B {
    a: A;
    val: Int;
}

struct C {
    b: B;
    flag: Bool;
}

contract TestContract {
    state: C;

    init() {
        self.state = C{
            b: B{ a: A{ f1: 99 }, val: 100 },
            flag: false
        };
    }

    receive() {
        self.state = self.state;
    }
}
