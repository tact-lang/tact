struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct MoreComplex {
    cmp: Complex;
    sa: String;
    sb: String?;
    num: Int;
    flag: Bool;
}

contract MultipleLayers {
    val: MoreComplex;

    init() {
        self.val = MoreComplex{
            cmp: Complex{
                a: 1,
                b: false,
                c: "X",
                d: null,
                e: null,
                f: null,
            },
            sa: "Y",
            sb: null,
            num: 42,
            flag: true,
        };
    }
}