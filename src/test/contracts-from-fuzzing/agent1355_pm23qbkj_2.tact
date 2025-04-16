struct VeryDeep {
    x: Int;
    y: String?;
}

struct MidDeep {
    p: VeryDeep;
    q: Bool;
}

struct TopLayer {
    m: MidDeep;
    n: Int;
}

contract DeepNestTest {
    layer: TopLayer;

    init() {
        self.layer = TopLayer{
            m: MidDeep{
                p: VeryDeep{
                    x: 1,
                    y: null
                },
                q: true
            },
            n: 42
        };
    }
}