// Compose a struct with deeply nested optional bounce-like pattern
struct A { x: Int?; }
struct B { a: A?; }
struct C { b: B?; }
struct D { c: C?; }

contract DeepOptChain {
    d: D;

    init() {
        self.d = D{ c: null };
    }
}
