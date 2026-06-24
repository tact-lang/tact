struct InnerStr {
    a: String;
    b: String?;
}

struct Wrap {
    inner: InnerStr;
    c: String?;
}

contract NestedStrings {
    val: Wrap;

    init() {
        self.val = Wrap{
            inner: InnerStr{
                a: "hello",
                b: null
            },
            c: "world"
        };
    }
}