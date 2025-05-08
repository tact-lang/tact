struct Complex {
    i: Int;
    s: String;
    b1: Bool;
    b2: Bool?;
    n: Int?;
    txt: String?;
}

contract LotsOfFields {
    x: Int;
    y: Int?;
    z: Bool;
    zz: Bool?;
    t: String;
    tt: String?;
    complex: Complex;

    init() {
        self.x = 5;
        self.y = null;
        self.z = true;
        self.zz = null;
        self.t = "a";
        self.tt = null;
        self.complex = Complex{
            i: 99,
            s: "hello",
            b1: true,
            b2: null,
            n: null,
            txt: null,
        };
    }
}