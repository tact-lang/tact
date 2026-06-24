struct ComposeA {
    val: Int;
}
struct ComposeB {
    val: Bool;
}

contract Test18 {
    a: ComposeA;
    b: ComposeB;

    init() {
        self.a = ComposeA{ val: 100 };
        self.b = ComposeB{ val: true };
    }
}
