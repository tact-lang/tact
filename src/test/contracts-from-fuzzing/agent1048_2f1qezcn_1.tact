struct InnerLevel {
    x: Int;
    y: Int?;
}

struct OuterLevel {
    first: Int;
    second: InnerLevel;
    third: Int?;
}

contract DeepNested {
    point: OuterLevel;

    init() {
        self.point = OuterLevel{
            first: 1,
            second: InnerLevel{
                x: 2,
                y: null,
            },
            third: null,
        };
    }
}