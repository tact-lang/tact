struct Deep1 { n: Int; }
struct Deep2 { inner: Deep1; }
struct Deep3 { inner: Deep2; }
struct Deep4 { inner: Deep3; }

contract DeeplyNestedContract {
    nested: Deep4 = Deep4{
        inner: Deep3{ inner: Deep2{ inner: Deep1{ n: 42 } } }
    };
}