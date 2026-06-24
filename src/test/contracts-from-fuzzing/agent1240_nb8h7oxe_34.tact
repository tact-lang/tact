struct ManyNestedStr {
    s1: String;
    opt: String?;
}

struct WrapperStr {
    inner: ManyNestedStr;
}

contract NestedStrings {
    val: WrapperStr;
    init() {
        self.val = WrapperStr{
            inner: ManyNestedStr{
                s1: "hello",
                opt: null
            }
        };
    }
}