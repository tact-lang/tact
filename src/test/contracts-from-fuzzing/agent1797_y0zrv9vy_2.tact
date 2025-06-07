struct Nested { inner: Simple; flag: Bool; }

struct Simple { x: Int; }

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: Simple{ x: 42 }, flag: true };
    }
}