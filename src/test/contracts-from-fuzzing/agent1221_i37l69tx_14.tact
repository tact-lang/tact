struct NestedString {
    inner: String;
}

struct OuterStr {
    nested: NestedString;
}

contract StringsInStructs {
    str: OuterStr;

    init() {
        self.str = OuterStr{
            nested: NestedString{ inner: "hello" }
        };
    }
}