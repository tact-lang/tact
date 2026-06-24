struct Deep1 { a: Int; }
struct Deep2 { b: Deep1; }
struct Deep3 { c: Deep2; }

contract DeeplyNested3 {
    val: Deep3 = Deep3{ c: Deep2{ b: Deep1{ a: 123 } } };
}