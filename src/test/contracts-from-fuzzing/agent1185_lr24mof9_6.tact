struct InnerMost {
    flag: Bool;
}

struct Second {
    inner: InnerMost?;
}

struct First {
    second: Second?;
}

contract NestedOptionalFields {
    f: First;
    init() {
        self.f = First{ second: null };
    }
}