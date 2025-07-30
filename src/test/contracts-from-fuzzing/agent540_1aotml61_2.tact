struct DeepNested {
    innermost: Bool;
}

struct MiddleNested {
    deep: DeepNested;
    flag: Bool;
}

struct OuterStruct {
    middle: MiddleNested;
    count: Int;
}

contract DeepNestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            middle: MiddleNested{
                deep: DeepNested{ innermost: true },
                flag: false,
            },
            count: 42,
        };
    }
}