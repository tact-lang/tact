struct C {
    k: Int;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract DeepStruct {
    data: A;
    init() {
        self.data = A{ b: B{ c: C{ k: 42 } } };
    }
}