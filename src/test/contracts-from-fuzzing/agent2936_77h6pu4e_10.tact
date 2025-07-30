struct A { next: B; valA: Int; }
struct B { next: C; valB: Int; }
struct C { next: D; valC: Int; }
struct D { valD: Int; }

contract Test {
    data: A;

    init() {
        self.data = A{
            next: B{
                next: C{
                    next: D{
                        valD: 77
                    },
                    valC: 55
                },
                valB: 33
            },
            valA: 11
        };
    }
}