struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: A;
    b2: A;
}

contract ReusedStructsTest {
    data: B;

    init() {
        self.data = B{
            b1: A{a1:1,a2:true},
            b2: A{a1:2,a2:false}
        };
    }
}
