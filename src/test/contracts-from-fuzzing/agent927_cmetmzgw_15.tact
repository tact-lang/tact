struct ThreeDeep {
    f1: Int;
    f2: Nested1;
}

struct Nested1 {
    g1: Bool;
    g2: Nested2;
}

struct Nested2 {
    h1: String;
}

contract DeepThree {
    d: ThreeDeep;

    init() {
        self.d = ThreeDeep{
            f1: 1,
            f2: Nested1{
                g1: true,
                g2: Nested2{ h1: "test" }
            }
        };
    }
}