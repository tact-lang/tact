struct Deep3 { val: Int; }
struct Deep2 { nest: Deep3; }
struct Deep1 { nest: Deep2; }

contract Test {
    s: Deep1;

    init() {
        self.s = Deep1{ nest: Deep2{ nest: Deep3{ val: 777 } } };
    }
}
