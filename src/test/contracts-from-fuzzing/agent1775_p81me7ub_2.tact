struct DeepNested {
    z: Bool = true;
}

struct Intermediate {
    y: Int = 7;
    d: DeepNested;
}

struct TopLevel {
    x: Int = 5;
    inner: Intermediate;
}

contract TestDeepNest {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            x: 1,
            inner: Intermediate{
                y: 2,
                d: DeepNested{z: false},
            }
        };
    }
}