struct DeepNestedStr {
    s1: String?;
    s2: String = "x";
}

struct Mid {
    inner: DeepNestedStr;
    note: String?;
}

contract StringNest {
    data: Mid;

    init() {
        self.data = Mid{
            inner: DeepNestedStr{
                s1: null
            },
            note: "ok"
        };
    }
}
