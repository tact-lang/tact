struct NestedSerialized {
    a: Int as uint16;
    b: Bool;
    c: Int as int32;
}

contract UseNestedSerialized {
    s: NestedSerialized;

    init() {
        self.s = NestedSerialized{ a:10, b:true, c:-32 };
    }
}