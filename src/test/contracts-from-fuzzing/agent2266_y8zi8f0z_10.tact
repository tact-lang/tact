struct A { x: Int }
struct B { y: Bool }
struct C { s: String }

struct Complex {
    a: A;
    b: B;
    optC: C?;
    z: Address;
    n: Int?;
}

contract Test {
    field: Complex;

    init() {
        self.field = Complex{
            a: A{x: 1},
            b: B{y: true},
            optC: null,
            z: myAddress(),
            n: -7,
        };
    }
}
