struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct WithNestedOpt {
    inner: NestedOpt?;
}

contract OptionalNestedStruct {
    val: WithNestedOpt;

    init() {
        self.val = WithNestedOpt{
            inner: NestedOpt{ a: null, b: true }
        };
    }
}