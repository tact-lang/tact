struct InnerMost {
    a: Int;
}

struct MidLevel {
    x: InnerMost?;
}

contract OptionalNested2 {
    data: MidLevel;

    init() {
        self.data = MidLevel{
            x: InnerMost{
                a: 56
            }
        };
    }
}
