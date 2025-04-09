struct A {
    a1: Int;
}
struct B {
    b1: A;
}
struct C {
    c1: B;
}

contract ManyOptionals {
    myVal: C?;

    init() {
        self.myVal = null;
    }
}
