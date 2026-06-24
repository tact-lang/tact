struct A {
    b: B;
}
struct B {
    c: C;
}
struct C {
    x: Int;
    y: Int?;
}

contract TestContract {
    a: A;
    init() {
        self.a = A{ b: B{ c: C{ x:1, y:null } } };
    }
}