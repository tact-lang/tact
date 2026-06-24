struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool;
    i: Int;
    j: String;
}

contract ComplexFields {
    field: Complex;

    init() {
        self.field = Complex{
            a:1,
            b:true,
            c:"c",
            d:null,
            e:false,
            f:"f",
            g:null,
            h:true,
            i:9,
            j:"j"
        };
    }
}