struct InnerLevel {
    a: Int;
    b: Bool;
}

struct MiddleLevel {
    x: Int?;
    y: InnerLevel;
}

struct OuterLevel {
    zz: Bool;
    m: MiddleLevel;
}

contract MultiLayer {
    state: OuterLevel;

    init() {
        self.state = OuterLevel{
            zz: false,
            m: MiddleLevel{
                x: null,
                y: InnerLevel{
                    a: 5,
                    b: true,
                },
            },
        };
    }
}