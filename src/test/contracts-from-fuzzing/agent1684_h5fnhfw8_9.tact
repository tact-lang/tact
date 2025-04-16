struct C { c: Int; }
struct B { b: Int; innerC: C; }
struct A { a: Int; innerB: B; }

contract DeepNestedInit {
    s: A;

    init() {
        self.s = A{
            a: 1,
            innerB: B {
                b: 2,
                innerC: C{ c: 3 }
            }
        };
    }
}