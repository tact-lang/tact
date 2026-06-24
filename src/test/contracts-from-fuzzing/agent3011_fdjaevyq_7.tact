struct Deep1 { a: Int; }
struct Deep2 { b: Deep1; }
struct Deep3 { c: Deep2; }

contract DeepDeepContract {
    d: Deep3;
    init() {
        self.d = Deep3{ c: Deep2{ b: Deep1{ a: 123 } } };
    }
}