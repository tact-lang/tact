struct InnerMost {
    value: Int;
}

struct Middle {
    innerMost: InnerMost;
}

contract OptionalDeepNested {
    data: Middle?;

    init() {
        self.data = Middle{
            innerMost: InnerMost{
                value: 321
            }
        };
    }
}
