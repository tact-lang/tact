struct A { x: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }

contract FiveLayers {
    layer: E;

    init() {
        self.layer = E{
            d: D{
                c: C{
                    b: B{
                        a: A{ x: 9 }
                    }
                }
            }
        };
    }
}