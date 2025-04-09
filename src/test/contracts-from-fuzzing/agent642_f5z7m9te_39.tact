// Edge: deeply nested chain of optional fields in contract state, defaulting to null
struct D { x: Int?; }
struct C { d: D?; }
struct B { c: C?; }
struct A { b: B?; }

contract MegaOpt {
    val: A?;
    init() {
        self.val = null;
    }
}