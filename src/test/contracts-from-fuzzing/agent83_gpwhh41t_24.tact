struct SeqA { val: Int; }
struct SeqB { val: Int; }
struct SeqC { val: Int; }
struct Combo {
    a: SeqA;
    b: SeqB;
    c: SeqC;
}

contract ChainCombo {
    field: Combo;
    init() {
        self.field = Combo{
            a: SeqA{val:1},
            b: SeqB{val:2},
            c: SeqC{val:3}
        };
    }
}
