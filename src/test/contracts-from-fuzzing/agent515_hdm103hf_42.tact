// Combination of optional primitives and optional nested structs
struct Inner {
    n: Int?;
    msg: String?;
}

contract OptionalMix {
    i: Int?;
    s: String?;
    inn: Inner?;

    init() {
        self.i = null;
        self.s = "qq";
        self.inn = Inner{n:null, msg:null};
    }
}