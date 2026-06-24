struct A {
    x: Int = 1;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract TestContract {
    val: C;
    init() {
        self.val = C{
            z: B{
                y: A{},
            },
        };
    }
    receive() {}
}