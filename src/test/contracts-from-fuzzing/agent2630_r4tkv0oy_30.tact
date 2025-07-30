struct StrNest {
    inner: InnerStr;
}

struct InnerStr {
    str: String;
}

contract StrInNested {
    s: StrNest;
    init() {
        self.s = StrNest{ inner: InnerStr{ str: "nested string" } };
    }
}