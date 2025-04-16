struct A {
    a: Int;
    b: Bool;
}

struct B {
    x: Int;
    y: Bool;
}

contract StructArrayTest {
    f1: A;
    f2: B;

    init() {
        self.f1 = A{a:1,b:true};
        self.f2 = B{x:2,y:false};
    }
}