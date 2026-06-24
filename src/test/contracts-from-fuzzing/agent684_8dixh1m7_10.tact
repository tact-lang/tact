struct InnerMost {
    x: Int;
    y: Int?;
}

struct Middle {
    a: InnerMost;
    b: Bool;
}

struct OuterMost {
    m: Middle;
    s: String?;
}

contract DeepStructContract {
    deepVal: OuterMost;
    init() {
        self.deepVal = OuterMost {
            m: Middle {
                a: InnerMost {
                    x: 5,
                    y: null,
                },
                b: false,
            },
            s: null,
        };
    }
}