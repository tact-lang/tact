struct InnerStr {
    s: String;
}

struct Middle {
    inner: InnerStr;
}

contract NestedStrContr {
    foo: Middle;

    init() {
        self.foo = Middle{ inner: InnerStr{ s: "hey" }};
    }
}