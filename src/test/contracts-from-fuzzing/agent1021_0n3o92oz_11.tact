struct Deep1 { val: Int; }
struct Deep2 { d: Deep1; }
struct Deep3 { d: Deep2; }
struct Deep4 { d: Deep3; }
struct Deep5 { d: Deep4; }

contract VeryDeep {
    deep: Deep5;

    init() {
        self.deep = Deep5{ d: Deep4{ d: Deep3{ d: Deep2{ d: Deep1{ val: 42 } } } } };
    }
}