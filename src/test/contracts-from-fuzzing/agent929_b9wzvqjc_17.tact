struct OptionalDeepNested {
    nested: StructNest?;
}

struct StructNest {
    inner: Innermost;
}

struct Innermost {
    foo: Int;
    bar: Bool?;
    text: String;
}

contract OptionalDeepChain {
    val: OptionalDeepNested;
    init() {
        self.val = OptionalDeepNested{
            nested: null
        };
    }
}