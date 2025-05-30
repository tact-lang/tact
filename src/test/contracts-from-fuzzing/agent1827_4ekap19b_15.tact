struct InnerLevel {
    val: Int;
    note: String;
}

struct MiddleLevel {
    midVal: InnerLevel;
}

struct OuterLevel {
    outVal: MiddleLevel;
}

contract TripleNestedStruct {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            outVal: MiddleLevel{
                midVal: InnerLevel{
                    val: 5,
                    note: "deep"
                }
            }
        };
    }
}