struct InnerMost {
    x: Int;
    y: Bool;
}

struct InnerLevel {
    z: InnerMost;
    text: String;
}

struct OuterMost {
    level: InnerLevel;
    optVal: Int?;
}

contract DeeplyNestedStructs {
    allData: OuterMost;

    init() {
        self.allData = OuterMost{
            level: InnerLevel{
                z: InnerMost{
                    x: 5,
                    y: true
                },
                text: "deep"
            },
            optVal: null
        };
    }

    receive() {
        if (self.allData.optVal == null) {
            self.allData.optVal = 1;
        } else {
            self.allData.optVal = self.allData.optVal!! + 1;
        }
    }
}