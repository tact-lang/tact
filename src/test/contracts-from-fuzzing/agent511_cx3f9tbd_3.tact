struct A {
    x: Int;
}

struct B {
    y: Int;
    inner: A;
}

struct C {
    z: Int;
    another: B;
}

contract TestContract {
    data: C;
    
    init() {
        self.data = C{
            z: 9,
            another: B{
                y: 8,
                inner: A{ x: 7 }
            }
        };
    }
}