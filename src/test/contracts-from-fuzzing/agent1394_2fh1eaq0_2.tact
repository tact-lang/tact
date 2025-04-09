struct DeepInner {
    d: Int;
    flag: Bool;
}

struct MidInner {
    inner: DeepInner;
    note: String;
}

contract DeepNested {
    nested: MidInner;

    init() {
        self.nested = MidInner{
            inner: DeepInner{d: 123, flag: false},
            note: "Deep"
        };
    }
}