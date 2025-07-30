struct InnerMost {
    z: Int?;
    w: Bool;
}

struct MiddleLevel {
    q: Int?;
    r: InnerMost;
}

struct OuterLevel {
    x: Int;
    y: MiddleLevel?;
}

contract DeepNest {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            x: 99,
            y: MiddleLevel{
                q: null,
                r: InnerMost{ z: 7, w: true }
            }
        };
    }
}
