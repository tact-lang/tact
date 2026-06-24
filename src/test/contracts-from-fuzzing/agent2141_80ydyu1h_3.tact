struct DeepNested {
    a: Int;
    b: String?;
}

struct Middle {
    x: DeepNested;
    y: DeepNested;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            m1: Middle{
                x: DeepNested{ a: 1, b: null },
                y: DeepNested{ a: 2, b: "b1" }
            },
            m2: Middle{
                x: DeepNested{ a: 3, b: "b2" },
                y: DeepNested{ a: 4, b: null }
            }
        };
    }
}