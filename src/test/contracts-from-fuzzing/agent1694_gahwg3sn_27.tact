struct A { a: Int }
struct B { b: A }
struct C { c: B }
struct D { d: C }

contract InitPartial {
    state: D;

    init() {
        self.state = D{
            d: C{
                c: B{
                    b: A{
                        a: 42
                    }
                }
            }
        };
    }
}