struct A1 { x: Int }
struct A2 { n: Int; a1: A1 }
struct A3 { n2: Int; a2: A2 }

contract DeepDefaultTest {
    nested: A3;

    init() {
        self.nested = A3 {
            n2: 3,
            a2: A2 { n: 2, a1: A1 { x: 1 } }
        };
    }

    receive() {
        let _ = self.nested.a2.a1.x;
    }
}