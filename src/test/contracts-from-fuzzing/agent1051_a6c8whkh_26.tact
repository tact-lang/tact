struct A { a: Int }
struct B { b: A }
struct C { c: B }
struct D { d: C }
contract TestContract {
    val: D;
    init() {
        self.val = D{
            d: C{
                c: B{
                    b: A{a: 42}
                }
            }
        };
    }
}