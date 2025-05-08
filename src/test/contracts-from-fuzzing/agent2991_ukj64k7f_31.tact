struct A { x: Int }

struct B { y: Int }

struct Combined {
    a: A;
    b: B;
}

contract Test {
    comb: Combined;

    init() {
        self.comb = Combined{
            a: A{ x: 1 },
            b: B{ y: 2 }
        };
    }
}