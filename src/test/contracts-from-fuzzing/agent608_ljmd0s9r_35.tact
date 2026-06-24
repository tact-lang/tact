// Attempt assign null explicitly to deep optional chain
struct A { val: B?; }
struct B { val: C?; }
struct C { val: D?; }
struct D { val: E?; }
struct E { val: F?; }
struct F { val: G?; }
struct G { q: Int?; }

contract OptionalDepthAssign {
    field: A? = null;
}
