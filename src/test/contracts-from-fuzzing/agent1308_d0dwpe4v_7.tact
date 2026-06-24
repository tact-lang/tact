struct A { x: Int; y: Int; }
struct B { a: A; z: Int; }
struct C { b: B; f: Bool; }

contract NestedOptional {
    data: C?;

    init() {
        self.data = C{
            b: B{
                a: A{
                    x: 1,
                    y: 2
                },
                z: 3
            },
            f: true
        };
    }
}