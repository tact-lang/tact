struct OptionalDeepNested {
    flag: Bool?;
    inner: String?;
}

struct Middle {
    nested: OptionalDeepNested?;
    value: Int;
}

contract TestContract {
    data: Middle;
    init() {
        self.data = Middle{
            nested: null,
            value: 42
        };
    }
}
