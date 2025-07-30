struct Deep3 { val3: Int; }
struct Deep2 { val2: Deep3; }
struct Deep1 { val1: Deep2; }

contract Test {
    param: Deep1;

    init() {
        self.param = Deep1{ val1: Deep2{ val2: Deep3{ val3: 123 } } };
    }
}
