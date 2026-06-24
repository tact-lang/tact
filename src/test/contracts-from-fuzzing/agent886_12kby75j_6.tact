struct Sub {
    g: Int;
}

struct Combo {
    a: Int;
    b: Bool;
    c: String;
    sub: Sub;
    maybeSub: Sub?;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: true,
            c: "hi",
            sub: Sub{ g: 2 },
            maybeSub: null
        };
    }
}