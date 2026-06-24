struct A { a1: Int; a2: String }
struct B { b1: Int; b2: A }
struct C { c1: Int; c2: B }

contract ManyNest {
    state: C;

    init() {
        self.state = C{
            c1: 0,
            c2: B{
                b1: 1,
                b2: A{
                    a1: 2,
                    a2: "nested"
                }
            }
        };
    }
}
