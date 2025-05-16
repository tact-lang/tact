struct Inner {
    aa: Int;
    bb: Bool;
    cc: String?;
}

contract DeepNullableField {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}