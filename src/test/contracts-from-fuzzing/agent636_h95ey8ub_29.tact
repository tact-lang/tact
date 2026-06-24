struct Complex {
    a: Int;
    b: Bool?;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int?;
    y: Bool;
}

contract ComplexStructFields {
    s: Complex;

    init() {
        self.s = Complex{
            a: 5,
            b: true,
            c: InnerStruct{
                x: null,
                y: false
            }
        };
    }
}