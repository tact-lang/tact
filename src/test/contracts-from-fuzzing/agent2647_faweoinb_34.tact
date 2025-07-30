message(111) Msg { v: Int }
struct Sub { q: Int? }

struct Combo {
    m: Msg?;
    sub: Sub;
    s: String?;
    vi: Int;
}

contract ComboComplex {
    val: Combo;

    init() {
        self.val = Combo{
            m: null,
            sub: Sub{q: null},
            s: null,
            vi: 123
        };
    }
}