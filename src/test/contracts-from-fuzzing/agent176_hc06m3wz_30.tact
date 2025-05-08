struct NestedNullStructs {
    s1: String?;
    s2: Int?;
}

struct OuterWithNestedNulls {
    n1: NestedNullStructs?;
    text: String;
}

contract NullStructFields {
    holder: OuterWithNestedNulls = OuterWithNestedNulls{
        n1: null,
        text: "hello"
    };

    init() {
        self.holder = OuterWithNestedNulls{
            n1: NestedNullStructs { s1: "x", s2: null },
            text: "bye"
        };
    }
}