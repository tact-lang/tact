struct DeepNester {
    a: Int;
    b: Bool;
}

struct MidNester {
    nested: DeepNester;
    opt: Int?;
}

struct TopNester {
    m: MidNester;
    name: String;
}

contract DeepNestTest {
    s: TopNester;

    init() {
        self.s = TopNester{
            m: MidNester{ nested: DeepNester{ a: 7, b: false }, opt: null },
            name: "deep"
        };
    }
}
