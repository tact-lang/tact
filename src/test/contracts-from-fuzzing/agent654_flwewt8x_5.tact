struct Nested1 { x: Int }
struct Nested2 { y: Int }
struct Nested3 { z: Int }

struct Complex {
    n1: Nested1;
    n2: Nested2?;
    n3: Nested3;
}

contract TestContract {
    cf: Complex;
    init() {
        self.cf = Complex{
            n1: Nested1{ x: 10 },
            n2: null,
            n3: Nested3{ z: 30 }
        };
    }
}