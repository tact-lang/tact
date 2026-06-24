struct Complex {
    inn: Inner;
    num: Int;
    text: String;
}

struct Inner {
    flag: Bool;
    opt: Int?;
}

contract Combo {
    dat: Complex;
    init() {
        self.dat = Complex{
            inn: Inner{ flag: false, opt: 10 },
            num: 3,
            text: "s"
        };
    }
}