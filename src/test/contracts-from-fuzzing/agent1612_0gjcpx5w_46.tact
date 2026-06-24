// complex optional override
struct Inner {
    str: String;
    flag: Bool;
}

struct Next {
    inner: Inner;
    note: String?;
}

contract OptionalOverride {
    data: Next?;

    init() {
        self.data = null;
    }
}
