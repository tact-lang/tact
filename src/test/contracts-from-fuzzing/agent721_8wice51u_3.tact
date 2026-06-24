struct Deep1 { a: Int }
struct Deep2 { a: Deep1 }
struct Deep3 { a: Deep2 }
struct Deep4 { a: Deep3 }

contract DeepNestTest {
    d: Deep4 = Deep4{ a: Deep3{ a: Deep2{ a: Deep1{ a: 5 } } } };
}