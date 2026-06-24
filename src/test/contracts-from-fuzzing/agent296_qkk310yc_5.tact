struct InnerMost {
    deepVal: Int?;
}

struct Middle {
    middleVal: Bool;
    nested: InnerMost;
}

struct OuterLayer {
    number: Int;
    middle: Middle;
}

contract DeepOptional {
    content: OuterLayer;

    init() {
        self.content = OuterLayer{
            number: 100,
            middle: Middle{
                middleVal: true,
                nested: InnerMost{
                    deepVal: null
                }
            }
        };
    }
}
