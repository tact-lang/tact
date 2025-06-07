struct InnerLevel {
    innerInt: Int;
    innerStr: String;
}

struct MiddleLevel {
    middleBool: Bool;
    nestedInner: InnerLevel;
}

contract MixedDeep {
    data: MiddleLevel;
    init() {
        self.data = MiddleLevel{
            middleBool: true,
            nestedInner: InnerLevel{
                innerInt: 5,
                innerStr: "deep"
            }
        };
    }
}