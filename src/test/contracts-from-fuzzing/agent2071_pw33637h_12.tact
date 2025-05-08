struct InnerLevel {
    s: String;
    flag: Bool?;
}

struct MiddleLevel {
    inn: InnerLevel;
}

struct OuterLevel {
    mid: MiddleLevel;
}

contract MixedDeep {
    test: OuterLevel;

    init() {
        self.test = OuterLevel {
            mid: MiddleLevel {
                inn: InnerLevel {
                    s: "test",
                    flag: true,
                },
            },
        };
    }
}