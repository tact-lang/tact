struct A { x: Int = 1; }
struct B { a: A; y: Bool?; }
struct C { b: B; s: String = "hi"; }
struct D { c: C; z: Bool?; }

contract Test {
    d: D;

    init() {
        self.d = D{
            c: C{
                b: B{
                    a: A{},
                    y: null
                },
                s: "hi there"
            },
            z: null
        };
    }
}