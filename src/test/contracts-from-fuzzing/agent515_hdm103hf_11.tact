struct InnerMost {
    f1: Int;
    f2: Bool;
}

struct MiddleLevel {
    nested: InnerMost?;
    flag: Bool;
}

struct OuterMost {
    inner: MiddleLevel?;
    name: String;
}

contract NestedOptStruct {
    data: OuterMost?;

    init() {
        self.data = OuterMost{
            inner: null,
            name: "hi"
        };
    }
}
