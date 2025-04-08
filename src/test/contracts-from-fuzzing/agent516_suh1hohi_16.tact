struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract StructChain {
    value: C;
    
    init() {
        self.value = C{ b: B{ a: A{ x: 1, y: 2 } } };
    }
}
