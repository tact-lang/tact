struct SubNested{
    a: Int;
    b: String?;
    c: Bool;
}
contract ManyInline {
    inner1: SubNested;
    inner2: SubNested;

    init() {
        self.inner1 = SubNested{ a: 1, b: null, c: false };
        self.inner2 = SubNested{ a: 2, b: "abc", c: true };
    }
}