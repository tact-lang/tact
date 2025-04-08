struct A { x: Int }
struct B { y: A }
struct C { z: B }

contract OptionalDeep {
    field: C?;
    init() {
        self.field = C{
            z: B{
                y: A{ x: 999 },
            },
        };
    }
}