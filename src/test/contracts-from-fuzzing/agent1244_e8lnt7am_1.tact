struct NestedStruct {
    inner1: Int;
    inner2: Bool?;
    inner3: String;
}

struct OuterStruct {
    ns: NestedStruct;
    flag: Bool;
    comment: String?;
}

contract NestTest {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct {
            ns: NestedStruct { inner1: 42, inner2: null, inner3: "abc" },
            flag: true,
            comment: null,
        };
    }
}
