struct NilStr {
    s: String?;
}

struct NilOuter {
    inner: NilStr?;
}

contract NullStrNest {
    field: NilOuter;

    init() {
        self.field = NilOuter{ inner:null };
    }
}