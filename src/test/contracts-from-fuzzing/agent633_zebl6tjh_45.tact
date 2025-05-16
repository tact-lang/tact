// Nested contract fields with default optional values
struct InnerNested {
    a: Int? = null;
    b: Bool? = null;
}

struct OuterNested {
    c: Int? = null;
    d: InnerNested = InnerNested{};
}

contract NestedDefaults2 {
    val: OuterNested = OuterNested{};
}