struct A {
    x: Int;
}

struct B {
    y: Bool;
}

contract TwoStructsFields {
    a: A;
    b: B;

    init() {
        self.a = A{x:10};
        self.b = B{y:true};
    }
}