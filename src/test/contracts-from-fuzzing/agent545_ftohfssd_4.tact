struct A { x: Int; y: Int }
struct B { a: A; z: Int }
struct C { b: B; s: String? }

contract TestContract {
    nested: C;

    init() {
        self.nested = C{
            b: B{
                a: A{ x: 1, y:2 },
                z: 3,
            },
            s: null,
        };
    }

    receive() {}
}