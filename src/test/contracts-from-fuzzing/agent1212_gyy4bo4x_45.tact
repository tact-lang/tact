contract NestedOptionalStruct {
    s: Inner?;
    init() {
        self.s = null;
    }
}

struct Inner {
    a: Int;
    b: String;
}