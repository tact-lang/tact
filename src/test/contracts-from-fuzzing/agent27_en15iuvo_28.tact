struct DeepStr {
    inner: String;
}

struct OuterStr {
    nested: DeepStr;
}

contract StringNest {
    s: OuterStr;

    init() {
        self.s = OuterStr{ nested: DeepStr{ inner: "hi" } };
    }
}