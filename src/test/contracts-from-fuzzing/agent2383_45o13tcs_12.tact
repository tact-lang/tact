struct MultiNested {
    inner1: InnerType;
    inner2: InnerType;
    extra: Int;
}

struct InnerType {
    s: String;
    flag: Bool;
}

contract TwoLevel {
    holder: MultiNested;
    init() {
        self.holder = MultiNested {
            inner1: InnerType{ s: "str1", flag: true },
            inner2: InnerType{ s: "str2", flag: false },
            extra: 5
        };
    }
}