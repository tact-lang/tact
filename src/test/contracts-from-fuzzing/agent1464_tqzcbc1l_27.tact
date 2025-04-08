struct ComposeA {
    val: Int;
}

struct ComposeB {
    val: Int?;
}

struct ComposeC {
    a: ComposeA;
    b: ComposeB;
    flag: Bool;
}

contract TestContract {
    cc: ComposeC;

    init() {
        self.cc = ComposeC{
            a: ComposeA{ val: 17 },
            b: ComposeB{ val: null },
            flag: false
        };
    }
}