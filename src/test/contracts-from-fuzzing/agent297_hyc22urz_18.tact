struct OptionalDeep {
    nested: Bool?;
}

struct Outer {
    inner: OptionalDeep?;
    val: Int;
}

contract TestContract {
    foo: Outer;

    init() {
        self.foo = Outer{
            inner: null,
            val: 100
        };
    }
}