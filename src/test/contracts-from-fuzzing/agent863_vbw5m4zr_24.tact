struct TwoLvl {
    a: Int;
    child: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract WrongOrder {
    s: TwoLvl;

    init() {
        self.s = TwoLvl{ a:1, child: Inner{ x:2, y:true } };
    }
}