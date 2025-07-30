struct A {
    x: Int;
}
struct B {
    y: Int;
}

contract MultiStructs {
    sa: A;
    sb: B;

    init() {
        self.sa = A{x:1};
        self.sb = B{y:2};
    }
}