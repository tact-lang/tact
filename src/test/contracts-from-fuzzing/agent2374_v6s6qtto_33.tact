struct NestedWithSerialization {
    a: Int as uint64;
    b: Bool;
}

struct DoubleNested {
    s: NestedWithSerialization;
    t: NestedWithSerialization;
}

contract SerializedNested {
    d: DoubleNested;

    init() {
        self.d = DoubleNested{
            s: NestedWithSerialization{ a:1, b:true },
            t: NestedWithSerialization{ a:2, b:false }
        };
    }
}