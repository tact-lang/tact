struct InnerLevel {
    x: Int;
    y: Bool?;
}

struct MidLevel {
    m: Int?;
    inr: InnerLevel;
}

struct OuterLevel {
    flag: Bool;
    mid: MidLevel;
}

contract MixedNested {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            flag: true,
            mid: MidLevel{
                m: null,
                inr: InnerLevel{
                    x: 77,
                    y: false
                }
            }
        };
    }
}
