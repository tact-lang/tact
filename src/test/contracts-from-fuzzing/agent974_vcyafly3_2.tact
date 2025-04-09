struct InnerMost {
    val: Int;
}

struct NestedLevel {
    level: InnerMost;
    flag: Bool;
}

contract ManyNestedStructs {
    deepField: NestedLevel;
    flag: Bool = false;

    init() {
        self.deepField = NestedLevel{
            level: InnerMost{ val: 123 },
            flag: true
        };
    }
}