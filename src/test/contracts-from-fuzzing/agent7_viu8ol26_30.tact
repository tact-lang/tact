// optional nested struct *with* default
struct Baz { x: Int = 3; }

struct Bar { baz: Baz? = null; }

contract OptionalStructDefault {
    bar: Bar = Bar{};

    init() {
        self.bar = Bar{ baz: null };
    }
}
