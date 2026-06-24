struct NestedString {
    a: String;
    b: InnerStr;
}

struct InnerStr {
    s1: String;
    s2: String;
}

contract TestContract {
    n: NestedString;
    init() {
        self.n = NestedString{
            a: "one",
            b: InnerStr{ s1: "two", s2: "three" }
        };
    }
}