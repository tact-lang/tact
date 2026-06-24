struct RecA { a: Int }
struct RecB { b: Int }
struct RecC { c: Int }

struct Combo {
    a: RecA;
    b: RecB;
    c: RecC;
}

contract ComboStructStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:RecA{a:1},
            b:RecB{b:2},
            c:RecC{c:3}
        };
    }
}