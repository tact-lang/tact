struct StringNest {
    s: String;
}
struct StringNestWrap {
    inner: StringNest;
}
contract DeepStringNest {
    s: StringNestWrap;
    init() {
        self.s = StringNestWrap{ inner: StringNest{ s: "hello" } };
    }
}