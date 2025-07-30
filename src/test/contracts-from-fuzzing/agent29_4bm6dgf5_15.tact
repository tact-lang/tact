struct NestedStrings {
    a: String;
    b: InnerStr;
}

struct InnerStr {
    sopt: String?;
}

contract NestedStringFieldsTest {
    ns: NestedStrings;

    init() {
        self.ns = NestedStrings{
            a: "world",
            b: InnerStr{
                sopt: null,
            }
        };
    }
}