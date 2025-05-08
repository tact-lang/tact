// Unusual ordering: optional primitive, nested struct, primitive
struct Inner { foo: Int }

contract WeirdOrder {
    a: Int?;
    b: Inner;
    c: Int;

    init() {
        self.a = null;
        self.b = Inner{ foo:123 };
        self.c = 456;
    }
}