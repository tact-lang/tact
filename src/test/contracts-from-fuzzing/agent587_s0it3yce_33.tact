struct RecA {
    val: Int;
}

struct RecB {
    a: RecA;
    optA: RecA?;
}

contract ComboStructOpt {
    b: RecB;
    init() {
        self.b = RecB{ a: RecA{val:1}, optA: null };
    }
    receive() {
        let _ = self.b.a.val;
    }
}