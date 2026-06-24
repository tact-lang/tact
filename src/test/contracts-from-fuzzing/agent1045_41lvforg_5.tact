struct InnerA { a: Int }
struct InnerB { b: Bool }
struct InnerC { c: String }

struct Combo {
    a: InnerA;
    b: InnerB;
    c: InnerC;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: InnerA{a: 5},
            b: InnerB{b: true},
            c: InnerC{c: "hi"}
        };
    }
}