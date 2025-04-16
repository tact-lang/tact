struct Combo2 {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

struct Combo3 {
    combo: Combo2;
    s2: String;
    flag: Bool;
}

contract DeepOptionals {
    data: Combo3;

    init() {
        self.data = Combo3{
            combo: Combo2{ a:1, b:null, c:"hi", d:null },
            s2: "yo",
            flag: true
        };
    }
}