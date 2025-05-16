struct A { x: Int; y: Bool }
struct B { m: A; s: String }
struct C { inner: B; z: Bool }

contract Chain {
    data: C;
    init() {
        self.data = C{
            inner: B{
                m: A{ x: 5, y: true },
                s: "hi"
            },
            z: false
        };
    }
}