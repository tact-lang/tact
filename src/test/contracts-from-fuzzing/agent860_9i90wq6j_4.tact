struct NestedOpt {
    val: Int?;
    inner: Inner?;
}

struct Inner {
    f: Bool;
    s: String;
}

contract OptContract {
    field: NestedOpt;

    init() {
        self.field = NestedOpt{
            val: null,
            inner: null
        };
    }
}