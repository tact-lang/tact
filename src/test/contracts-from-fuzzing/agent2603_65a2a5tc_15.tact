struct A { x: Int }
struct B { y: Int }

struct Outer {
    a: A;
    b: B;
}

contract MultiNested {
    field: Outer;

    init() {
        self.field = Outer{
            a: A{ x: 1 },
            b: B{ y: 2 },
        };
    }
}