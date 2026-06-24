struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    opt: Bool?;
}

contract DeepOption {
    data: A;
    init() {
        self.data = A{ b: B{ c: C{ opt: true } } };
    }
}