struct InnerS { i: Int; b: Bool; }

struct OuterS { s: InnerS; o: Int?; }

contract OptionalNestedStructTest {
    nested: OuterS?;

    init() {
        self.nested = null;
    }
}