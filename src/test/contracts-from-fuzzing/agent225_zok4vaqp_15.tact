struct A {
    x: Int;
}
struct B {
    y: Int;
    a: A;
}
struct C {
    z: Int;
    b: B;
}

contract Test {
    top: C;

    init() {
        self.top = C{
            z: 1,
            b: B{
                y: 2,
                a: A{ x: 3 }
            }
        };
    }
}