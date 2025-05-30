struct OptionalDeepNested {
    inner: Inner?;
    active: Bool;
}

struct Inner {
    n: Int;
    label: String;
}

contract OptionalDeep {
    val: OptionalDeepNested;

    init() {
        self.val = OptionalDeepNested{
            inner: null,
            active: true
        };
    }
}