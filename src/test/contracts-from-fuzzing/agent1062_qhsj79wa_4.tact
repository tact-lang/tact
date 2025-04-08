struct Deep1 { a: Int = 1; }
struct Deep2 { d1: Deep1; }
struct Deep3 { d2: Deep2; }
struct Deep4 { d3: Deep3; }
struct Deep5 { d4: Deep4; }

contract Test {
    nested: Deep5 = Deep5{ d4: Deep4{ d3: Deep3{ d2: Deep2{ d1: Deep1{ a: 99 } } } } };
    
    init() {
        self.nested = Deep5{ d4: Deep4{ d3: Deep3{ d2: Deep2{ d1: Deep1{ a: 123 } } } } };
    }
}