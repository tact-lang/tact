struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }

contract NestedChain {
    data: C;

    init() {
        self.data = C{
            c: B{
                b: A{a:42}
            }
        };
    }
}