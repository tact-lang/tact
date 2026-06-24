struct A { a: Int; }
struct B { b: Int; aStruct: A; }
struct C { c: Int; bStruct: B; }
struct D { d: Int; cStruct: C; }

contract DeepFourNest {
    root: D;

    init() {
        self.root = D{
            d: 4,
            cStruct: C{
                c: 3,
                bStruct: B{
                    b: 2,
                    aStruct: A{ a: 1 },
                },
            },
        };
    }
}