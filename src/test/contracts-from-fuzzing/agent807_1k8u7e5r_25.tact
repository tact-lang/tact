struct NestedSerialOpts {
    a: Int? as uint8;
    b: String?;
}

contract OptSerialization {
    val: NestedSerialOpts;
    init() {
        self.val = NestedSerialOpts{
            a: null,
            b: null
        };
    }
}