struct InnerDeep {
    num: Int;
    flag: Bool;
    text: String;
}

struct OuterDeep {
    nested: InnerDeep;
    optInt: Int?;
    anotherFlag: Bool;
}

contract DeepNestedStorage {
    storage: OuterDeep;

    init() {
        self.storage = OuterDeep{
            nested: InnerDeep{ num: 7, flag: false, text: "hi" },
            optInt: null,
            anotherFlag: true
        };
    }
}