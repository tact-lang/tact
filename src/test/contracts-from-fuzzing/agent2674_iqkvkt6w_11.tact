struct DeepVariant1 {
    level: Int;
    optSub: DeepVariant2?;
}

struct DeepVariant2 {
    text: String;
    optInner: DeepVariant3?;
}

struct DeepVariant3 {
    flag: Bool;
}

contract OptionallyNestedStruct {
    data: DeepVariant1;

    init() {
        self.data = DeepVariant1{
            level: 5,
            optSub: DeepVariant2{
                text: "testing",
                optInner: null,
            },
        };
    }
}