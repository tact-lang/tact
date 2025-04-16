struct StringNested {
    s: String;
    opt: String?;
}

struct TopContainer {
    inner: StringNested;
    title: String;
}

contract StructWithStringsTest {
    data: TopContainer;
    init() {
        self.data = TopContainer {
            inner: StringNested { s: "abc", opt: null },
            title: "def"
        };
    }
}