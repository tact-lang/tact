struct Complex {
    intOpt: Int?;
    boolOpt: Bool?;
    str: String;
    inner: Inner;
}

struct Inner {
    num: Int;
    flag: Bool;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            intOpt: null,
            boolOpt: false,
            str: "hi",
            inner: Inner{ num: 77, flag: true }
        };
    }
}