struct NestedDeep {
    s: String;
    inner: DeepInner;
}

struct DeepInner {
    n: Int;
    opt: NestedOpt;
}

struct NestedOpt {
    b: Bool?;
    s: String?;
}

contract Test13 {
    val: NestedDeep;

    init() {
        self.val = NestedDeep{
            s: "foo",
            inner: DeepInner{
                n: 123,
                opt: NestedOpt{
                    b: null,
                    s: null,
                }
            }
        };
    }

    receive() {}
}