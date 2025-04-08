struct Deep1 { a: Int; }
struct Deep2 { d1: Deep1; }
struct Deep3 { d2: Deep2; }
struct Deep4 { d3: Deep3; }

contract Test {
    deep: Deep4 = Deep4{ d3: Deep3{ d2: Deep2{ d1: Deep1{ a: 42 }}}};
}