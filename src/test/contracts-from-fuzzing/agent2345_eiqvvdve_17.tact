struct A { v: Int }
struct B { a1: A; a2: A; a3: A }
struct C { b1: B; b2: B }

contract StructStruct {
    c: C;

    init() {
        self.c = C{
            b1: B{
                a1: A{ v: 1 },
                a2: A{ v: 2 },
                a3: A{ v: 3 },
            },
            b2: B{
                a1: A{ v: 4 },
                a2: A{ v: 5 },
                a3: A{ v: 6 },
            }
        };
    }
}