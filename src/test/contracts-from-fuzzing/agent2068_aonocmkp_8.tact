struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalsUnleashed {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1, b:true, c:"x", d:null, e:null, f:null
        };
    }
}