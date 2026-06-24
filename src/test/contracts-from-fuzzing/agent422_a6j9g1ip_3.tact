struct Deep1 {
    a: Int;
}

struct Deep2 {
    b: Deep1;
}

struct Deep3 {
    c: Deep2;
}

contract DeepNestTest {
    val: Deep3;

    init() {
        self.val = Deep3{ c: Deep2{ b: Deep1{ a: 123 } } };
    }
}