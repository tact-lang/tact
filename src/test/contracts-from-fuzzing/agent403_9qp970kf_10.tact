struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Int;
    f: Bool;
    g: String?;
    h: Address;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1, b:null, c:"x", d:myAddress(), e:5, f:true, g:null, h:myAddress()
        };
    }
}
