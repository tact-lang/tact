struct InnerLevel {
    foo: Int;
    bar: Bool;
}

struct MiddleLevel {
    inner1: InnerLevel;
    inner2: InnerLevel;
}

struct OuterLevel {
    mid1: MiddleLevel;
    mid2: MiddleLevel;
}

contract MassiveNest {
    val: OuterLevel;
    init() {
        self.val = OuterLevel{
            mid1: MiddleLevel{
                inner1: InnerLevel{ foo: 1, bar: true },
                inner2: InnerLevel{ foo: 2, bar: false }
            },
            mid2: MiddleLevel{
                inner1: InnerLevel{ foo: 3, bar: true },
                inner2: InnerLevel{ foo: 4, bar: false }
            }
        };
    }
}