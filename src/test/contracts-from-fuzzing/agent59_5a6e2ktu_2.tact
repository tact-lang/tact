struct A {
    a1: Int;
    a2: Int?;
}

struct B {
    b1: Int?;
    b2: A;
}

contract TestContract {
    myData: B;

    init() {
        self.myData = B{
            b1: null,
            b2: A{ a1: 10, a2: null }
        };
    }
}