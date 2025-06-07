struct Small {
    x: Int?
}
struct Big {
    sma: Small;
    s: String;
    b: Bool;
    opt: Bool?;
    i: Int?;
}

contract K {
    big: Big;
    init() {
        self.big = Big{
            sma: Small{x:null},
            s: "S",
            b: false,
            opt: null,
            i: null
        };
    }
}