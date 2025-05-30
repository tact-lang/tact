struct StringNest {
    s: String;
    inner: SubNest;
}

struct SubNest {
    val: Int;
    flag: Bool;
}

contract TestStrings {
    data: StringNest;

    init() {
        self.data = StringNest{
            s: "Hello",
            inner: SubNest{ val: 123, flag: true },
        };
    }
}
