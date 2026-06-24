struct Deep1 { d2: Deep2; }
struct Deep2 { d3: Deep3; }
struct Deep3 { d4: Deep4; }
struct Deep4 { d5: Deep5; }
struct Deep5 { val: Int; }

contract TestContract {
    nested: Deep1;
    init() {
        self.nested = Deep1{ d2: Deep2{ d3: Deep3{ d4: Deep4{ d5: Deep5{ val: 77 } } } } };
    }
}