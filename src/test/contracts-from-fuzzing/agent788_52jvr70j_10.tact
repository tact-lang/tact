struct Complex {
    p: Int as uint32;
    q: Bool;
    r: String;
    s: Int?;
    t: Bool?;
    u: String?;
}

contract StructInStruct {
    cx: Complex;
    cy: Complex;

    init() {
        self.cx = Complex{
            p: 5, q: true, r: "x", s: null, t: true, u: null
        };
        self.cy = Complex{
            p: 10, q: false, r: "y", s: -1, t: null, u: "opt"
        };
    }
}