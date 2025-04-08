struct NestedOptional {
    n: Int?;
    s: String?;
    f: Bool?;
}

contract AllNulls {
    inner: NestedOptional;

    init() {
        self.inner = NestedOptional{ n: null, s: null, f: null };
    }
}