struct NestedStrings {
    inner: SubString;
    optInner: SubString?;
}

struct SubString {
    s1: String;
    s2: String;
}

contract NestedStringTest {
    field: NestedStrings;
    init() {
        self.field = NestedStrings{
            inner: SubString{ s1: "foo", s2: "bar" },
            optInner: SubString{ s1: "baz", s2: "qux" }
        };
    }
}