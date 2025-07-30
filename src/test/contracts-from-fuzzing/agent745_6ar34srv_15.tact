struct A { x: Int }
struct B { y: A }
struct C { z: B }

contract OptionalMidNest {
    inner: C?;
    init() {
        self.inner = C{
            z: B{
                y: A{
                    x: 999
                }
            }
        };
    }
}