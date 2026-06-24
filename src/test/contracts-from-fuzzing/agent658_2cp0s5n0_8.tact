struct A { a: Int }
struct B { b: Int }
struct C { a: A; b: B }
struct D { c: C; d: Int }

contract NestedCombined {
    st: D;

    init() {
        self.st = D{
            c: C{
                a: A{a: 10},
                b: B{b: 20}
            },
            d: 30
        };
    }
}