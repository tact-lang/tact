struct A { x: Int }
struct B { y: Int }

struct C {
    a: A;
    b: B;
}

contract CrossNest {
    val: C;

    init() {
        self.val = C{
            a: A{ x: 111 },
            b: B{ y: 222 },
        };
    }
}