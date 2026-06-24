struct A {
    f1: Int;
    f2: Bool;
    f3: Address;
}

struct B {
    b1: Int;
    b2: A;
    b3: Bool;
}

contract MultiNest {
    complex: B;
    init() {
        self.complex = B{ b1: 3, b2: A{ f1: 1, f2: false, f3: myAddress() }, b3: true };
    }
}