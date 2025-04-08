struct Deep1 { a: Int; }
struct Deep2 { d1: Deep1; b: Int; }
struct Deep3 { d2: Deep2; c: Int; }

contract DeepTest {
    val: Deep3 = Deep3{ d2: Deep2{ d1: Deep1{ a: 1 }, b: 2 }, c: 3 };

    init() {
        self.val = Deep3{ d2: Deep2{ d1: Deep1{ a: 10 }, b: 20 }, c: 30 };
    }
}
