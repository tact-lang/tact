struct Deep1 { val: Int; }
struct Deep2 { nest: Deep1; }
struct Deep3 { nest: Deep2; }
struct Deep4 { nest: Deep3; }

contract VeryDeep {
    data: Deep4;
    init() {
        self.data = Deep4{ nest: Deep3{ nest: Deep2{ nest: Deep1{ val: 0 } } } };
    }
}