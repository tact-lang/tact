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

contract TestContract {
    deepVal: C;

    init() {
        self.deepVal = C{
            z: 7,
            b: B{
                y: 8,
                a: A{x: 9}
            }
        };
    }

    receive() {
        let _ = self.deepVal.b.a.x;
    }
}