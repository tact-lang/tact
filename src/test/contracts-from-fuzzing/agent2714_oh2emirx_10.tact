struct Deep1 { f1: Int; }
struct Deep2 { f2: Deep1; }
struct Deep3 { f3: Deep2; }
struct Deep4 { f4: Deep3; }

contract Test10 {
    d: Deep4;

    init() {
        self.d = Deep4{ f4: Deep3{ f3: Deep2{ f2: Deep1{ f1: 42 } } } };
    }
}