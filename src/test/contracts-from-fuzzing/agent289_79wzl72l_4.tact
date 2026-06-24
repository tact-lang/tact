struct InnerMost {
    x: Int;
    y: Bool;
}

struct MidLevel {
    inner: InnerMost;
    note: String;
}

struct OuterMost {
    m1: MidLevel;
    m2: MidLevel;
}

contract RepeatedNestedStructs {
    payload: OuterMost;

    init() {
        self.payload = OuterMost{
            m1: MidLevel{
                inner: InnerMost{ x: 11, y: true },
                note: "first"
            },
            m2: MidLevel{
                inner: InnerMost{ x: 22, y: false },
                note: "second"
            }
        };
    }
}