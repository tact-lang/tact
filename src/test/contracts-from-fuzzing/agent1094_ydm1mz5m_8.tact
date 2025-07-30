struct Simple {
    n: Int;
    f: Bool;
}

struct Wrapped {
    value: Simple;
}

contract NestedStructTest {
    nested: Wrapped;

    init() {
        self.nested = Wrapped{value: Simple{n: 5, f: true}};
    }
}