// Deep optional nesting chain (single optionals, no nesting the option type)
struct A { a: Int?; }
struct B { b: A?; }
struct C { c: B?; }
struct D { d: C?; }

contract DeepOpt {
    data: D;

    init() {
        self.data = D{ d: null };
    }
}
