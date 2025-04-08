struct NestedWithOption {
    s: String;
    inner: InnerOpt;
}

struct InnerOpt {
    test: Int?;
    s2: String;
}

contract NestedOptionalStructs {
    val: NestedWithOption;

    init() {
        self.val = NestedWithOption{
            s: "aaa",
            inner: InnerOpt{test: null, s2:"bbb"}
        };
    }
}
