message(5) Msg { v: Int; }

struct S { s: String; }

contract TestContract {
    i: Int?;
    s: S?;
    m: Msg?;

    init() {
        self.i = null;
        self.s = null;
        self.m = null;
    }
}