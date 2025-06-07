struct DeepNested {
    level: Int;
    inner: Inner?
}

struct Inner {
    value: Int;
    optional: Int?;
    nested: Nested?
}

struct Nested {
    flag: Bool;
    message: String;
}

contract StructInStruct {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            level: 1,
            inner: null
        };
    }
}