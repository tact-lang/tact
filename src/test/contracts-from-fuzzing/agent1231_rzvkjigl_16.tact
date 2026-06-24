struct Complex {
    a: Int;
    b: Bool?;
    c: StrNested;
}

struct StrNested {
    s: String;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    number: Int?;
}

contract TestContract {
    field: Complex;

    init() {
        self.field = Complex{
            a: 9,
            b: true,
            c: StrNested{
                s: "str",
                inner: InnerOpt{flag:false, number:null}
            }
        };
    }
}
