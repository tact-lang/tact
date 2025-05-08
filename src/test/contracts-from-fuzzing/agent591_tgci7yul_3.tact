struct Deep1 { a: Int; }
struct Deep2 { sub: Deep1; }
struct Deep3 { sub: Deep2; }
struct Deep4 { sub: Deep3; }

contract DeepNest {
    deep: Deep4;
    init() {
        self.deep = Deep4{ sub: Deep3{ sub: Deep2{ sub: Deep1{ a: 42 } } } };
    }
}