struct A { x: Int; }
struct B { y: Bool; nested: A; }
struct C { z: Int; inner: B; }

contract RecursiveEmbedded {
    base: C;

    init() {
        self.base = C{
            z: 99,
            inner: B{
                y: true,
                nested: A{ x: 42 }
            }
        };
    }
}