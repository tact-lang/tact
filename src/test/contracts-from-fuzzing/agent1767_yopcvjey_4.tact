struct Deep1 { a: Int; }
struct Deep2 { d: Deep1; }
struct Deep3 { e: Deep2; }
struct Deep4 { f: Deep3; }

contract DeepChain {
    s: Deep4;

    init() {
        self.s = Deep4{ f: Deep3{ e: Deep2{ d: Deep1{ a: 123 } } } };
    }
}
