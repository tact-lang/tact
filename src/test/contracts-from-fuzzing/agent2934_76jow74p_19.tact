struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract NestedDefaults {
    t: C;

    init() {
        self.t = C{
            z: B{
                y: A{ x: 100 }
            }
        };
    }
}