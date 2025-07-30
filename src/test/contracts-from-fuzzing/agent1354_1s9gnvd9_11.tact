struct A {
    a1: Int;
    a2: Bool;
    a3: Int?;
}

struct B {
    b1: A;
    b2: Int;
    b3: Bool?;
}

contract TestContract {
    data: B;

    init() {
        self.data = B{
            b1: A{ a1: 7, a2: false, a3: null },
            b2: 9,
            b3: true
        };
    }
}