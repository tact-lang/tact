struct NestedString {
    text1: String = "abc";
    inner: InnerS;
}

struct InnerS {
    text2: String = "def";
    textOpt: String?;
}

contract ManyStrings {
    s: NestedString;

    init() {
        self.s = NestedString{
            text1: "hello",
            inner: InnerS{ text2: "world", textOpt:null }
        };
    }
}