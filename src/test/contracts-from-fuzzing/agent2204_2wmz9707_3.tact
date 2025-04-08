struct Deep1 { a: Int; }
struct Deep2 { nested: Deep1; }
struct Deep3 { nested: Deep2; }
struct Deep4 { nested: Deep3; }
struct Deep5 { nested: Deep4; }

contract DepthFiveNested {
    val: Deep5;
    init() {
        self.val = Deep5{ nested: Deep4{ nested: Deep3{ nested: Deep2{ nested: Deep1{ a: 7 } } } } };
    }
}