// Contract with very deep nested optional structs (7 deep)
struct A { val: B?; }
struct B { val: C?; }
struct C { val: D?; }
struct D { val: E?; }
struct E { val: F?; }
struct F { val: G?; }
struct G { q: Int?; }

contract OptionalDepthSeven {
    field: A?;
}
