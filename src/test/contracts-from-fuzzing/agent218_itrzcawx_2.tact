struct DeepNested {
    value: Int?;
}

struct MiddleNested {
    deep: DeepNested;
}

struct TopLevel {
    middle: MiddleNested;
    flag: Bool;
}

contract DeepNestedFields {
    meta: TopLevel;

    init() {
        self.meta = TopLevel{
            middle: MiddleNested{ deep: DeepNested{ value: null } },
            flag: true
        };
    }
}