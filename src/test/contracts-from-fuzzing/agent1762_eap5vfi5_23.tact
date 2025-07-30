struct StrNest {
    s1: String;
    s2: String?;
}

contract StringNestedStorage {
    inner: StrNest;
    init() {
        self.inner = StrNest{ s1: "abc", s2: null };
    }
}