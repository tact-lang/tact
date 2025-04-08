struct DeepNested {
    inner1: Int;
    inner2: Bool;
}

struct Middle {
    m1: Int;
    m2: DeepNested;
    m3: Bool?;
}

contract TestContract {
    nested: Middle;

    init() {
        self.nested = Middle{
            m1: 5,
            m2: DeepNested{inner1: 10, inner2: false},
            m3: null
        };
    }
}