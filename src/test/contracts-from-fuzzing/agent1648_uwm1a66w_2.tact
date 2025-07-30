struct InnerMost {
    x: Int;
    y: Int;
}

struct Mid {
    left: InnerMost;
    right: InnerMost?;
}

struct Top {
    m: Mid;
    z: Int;
}

contract DeepNested {
    data: Top;

    init() {
        self.data = Top{
            m: Mid{
                left: InnerMost{ x: 1, y: 2 },
                right: null
            },
            z: 42
        };
    }
}