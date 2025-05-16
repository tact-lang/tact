struct Combo {
    s: Inner;
    sOpt: Inner?;
    flag: Bool;
    num: Int;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo{
            s: Inner{ a: 42, b: true },
            sOpt: null,
            flag: false,
            num: 77,
        };
    }
}