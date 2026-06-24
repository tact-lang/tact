struct InnerMost {
    x: Int;
}

struct Middle {
    y: InnerMost;
}

struct OuterMost {
    z: Middle;
}

contract DeeplyNestedStructs {
    data: OuterMost;
    init() {
        self.data = OuterMost {
            z: Middle {
                y: InnerMost {
                    x: 123
                }
            }
        };
    }
}