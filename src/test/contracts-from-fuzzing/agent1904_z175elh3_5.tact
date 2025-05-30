struct DeepNested {
    a: Int?;
    b: Bool?;
    c: Nested?;
}

struct Nested {
    m: Int;
    n: InnerMost;
}

struct InnerMost {
    x: Int;
    y: String?;
}

contract Test {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            a: null,
            b: null,
            c: Nested{
                m: 1,
                n: InnerMost{
                    x: 5,
                    y: null,
                }
            }
        };
    }
}