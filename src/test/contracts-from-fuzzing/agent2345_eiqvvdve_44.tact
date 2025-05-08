struct Big {
    x: Int;
    y: Int;
    s: String;
    t: String;
    z: Bool;
}

contract ManyData {
    f1: Big;
    f2: Big;
    f3: Big;

    init() {
        self.f1 = Big{ x:1, y:2, s:"a", t: "b", z:true };
        self.f2 = Big{ x:3, y:4, s:"c", t: "d", z:false };
        self.f3 = Big{ x:5, y:6, s:"e", t: "f", z:true };
    }
}