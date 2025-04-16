// Edge case: deeply nested optionals in a struct (non-recursive)
struct L4 { d: Int?; }
struct L3 { c: L4?; }
struct L2 { b: L3?; }
struct L1 { a: L2?; }

contract DeepOptionals {
    nested: L1;

    init() {
        self.nested = L1{ a: L2{ b: L3{ c: L4{ d: 42 } } } };
    }
}