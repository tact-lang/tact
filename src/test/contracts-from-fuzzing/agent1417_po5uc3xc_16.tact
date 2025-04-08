struct A { f1: Int; f2: Bool; }
struct B { g1: String; g2: A; g3: String; }
struct C { h1: B; h2: Int?; h3: Bool; }

contract LayerCake {
    s: C;
    init() {
        self.s = C{
            h1: B{
                g1: "hello",
                g2: A{ f1:42, f2: true },
                g3: "world"
            },
            h2: null,
            h3: false
        };
    }
}