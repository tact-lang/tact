struct StringNesting {
    s: String;
    optS: String?;
}

struct DeepStrings {
    a: StringNesting;
    b: StringNesting;
    c: StringNesting;
}

contract StringsTest {
    data: DeepStrings;
    init() {
        self.data = DeepStrings{
            a: StringNesting{ s: "a", optS: null },
            b: StringNesting{ s: "b", optS: "optional" },
            c: StringNesting{ s: "c", optS: null }
        };
    }
}
