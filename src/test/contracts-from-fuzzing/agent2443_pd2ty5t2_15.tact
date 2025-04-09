struct Combo {
    i : Int;
    b : Bool;
    s : String;
    a : Address;
    oi : Int?;
    ob : Bool?;
    os : String?;
    oa : Address?;
}

contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo {
            i: 1,
            b: true,
            s: "x",
            a: myAddress(),
            oi: null,
            ob: null,
            os: null,
            oa: null
        };
    }
}