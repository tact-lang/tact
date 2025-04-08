struct InnerMost {
    z: Int;
}

struct MidLevel {
    y: InnerMost?;
}

struct TopLevel {
    x: MidLevel?;
}

contract DeepOptional {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            x: null
        };
    }
}