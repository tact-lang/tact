struct Combination1 {
    a: Int;
    b: Bool?;
}

struct Combination2 {
    c: String;
    d: Int?;
}

struct Combination3 {
    s1: Combination1;
    s2: Combination2;
}

contract MixCombo {
    combo: Combination3;
    init() {
        self.combo = Combination3{
            s1: Combination1{a:5,b:null},
            s2: Combination2{c:"hi",d:null}
        };
    }
}