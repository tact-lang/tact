struct A {
    x: Int;
}

struct B {
    y: Int;
    z: A;
}

contract Test {
    a: A;
    b: B;
    
    init() {
        self.a = A{x:1};
        self.b = B{y:2,z:self.a};
    }
}