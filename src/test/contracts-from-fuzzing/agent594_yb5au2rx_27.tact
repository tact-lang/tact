struct A {
    x: Int;
}

struct B {
    a: A;
}

contract ModifyNested {
    data: B;
    init() {
        self.data = B{ a: A{ x: 7 } };
        self.data.a.x = 77;
    }
}