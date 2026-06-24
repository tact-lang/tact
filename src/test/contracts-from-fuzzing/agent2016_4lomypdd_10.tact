struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Inner;
}

struct Inner {
    flag: Bool;
    txt: String;
    optInt: Int?;
}

contract C1 {
    v: Complex;
    init() {
        self.v = Complex{
            a:1, b:true, c:null, d:null,
            e:Inner{ flag:false, txt:"hi", optInt:null }
        };
    }
}