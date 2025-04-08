struct A { x: Int; y: Bool; }
struct B { a: A; z: Int; }
struct C { b: B; s: String; }

contract RecursionTest {
    storage: C;

    init() {
        self.storage = C{
            b: B{
                a: A{
                    x: 1,
                    y: true
                },
                z: 2
            },
            s: "abc"
        };
    }
}