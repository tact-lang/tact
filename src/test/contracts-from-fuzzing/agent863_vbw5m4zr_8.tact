struct StringNest {
    a: String;
    b: String?;
}

struct ContainStringNest {
    inner: StringNest;
    other: String;
}

contract StringTest {
    s: ContainStringNest;

    init() {
        self.s = ContainStringNest{
            inner: StringNest{ a: "hello", b: null },
            other: "world"
        };
    }
}