struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract MidChain {
    foo: Int;
    bar: C;

    init() {
        self.foo = 0;
        self.bar = C{
            z: B{
                y: A{ x: 100 }
            }
        };
    }
}