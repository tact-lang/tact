struct Nested1 { val: Int }
struct Nested2 { inner: Nested1 }

contract OptionalNestedCombined {
    a: Int? = null;
    s: Nested2;

    init() {
        self.a = null;
        self.s = Nested2{ inner: Nested1{ val: 123 }};
    }
}