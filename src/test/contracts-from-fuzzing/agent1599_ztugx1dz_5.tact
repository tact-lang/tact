struct Deep1 { a: Int }
struct Deep2 { a: Deep1 }
struct Deep3 { a: Deep2 }
struct Deep4 { a: Deep3 }
struct Deep5 { a: Deep4 }

contract DeepDepth {
    d: Deep5;

    init() {
        self.d = Deep5{ a: Deep4{ a: Deep3{ a: Deep2{ a: Deep1{ a: 123 } } } } };
    }
}