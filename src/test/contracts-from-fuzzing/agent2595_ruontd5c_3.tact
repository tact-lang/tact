struct DeepNested {
    innerValue: Int as uint64;
    innerFlag: Bool;
}

struct MiddleNest {
    deep: DeepNested;
    middleFlag: Bool;
}

struct OuterNest {
    middle: MiddleNest;
    outerNumber: Int;
}

contract DeepNestContract {
    payload: OuterNest;

    init() {
        self.payload = OuterNest{
            middle: MiddleNest{
                deep: DeepNested{innerValue: 777, innerFlag: true},
                middleFlag: false
            },
            outerNumber: 42
        };
    }
}