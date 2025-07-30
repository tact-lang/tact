struct ComposeA {
    a: Int;
}
struct ComposeB {
    b: Int;
}

contract DisjointStructs {
    sa: ComposeA;
    sb: ComposeB;

    init() {
        self.sa = ComposeA{ a:1 };
        self.sb = ComposeB{ b:2 };
    }
}