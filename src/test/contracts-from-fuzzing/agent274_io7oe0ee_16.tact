struct Complex {
    a: Int;
    b: Inner;
    c: InnerOption;
}

struct Inner {
    x: Int;
    y: Bool;
}

struct InnerOption {
    s: String?;
    z: Int?;
}

contract ComplexNested {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: Inner{
                x:2,
                y:true,
            },
            c: InnerOption{
                s:null,
                z:null,
            },
        };
    }

    receive() {}
}
