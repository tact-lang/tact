struct A { n: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }
struct F { e: E }

contract DeepParams(p: F) {}