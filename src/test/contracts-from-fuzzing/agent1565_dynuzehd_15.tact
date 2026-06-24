struct Complex1 {
    i1: Int;
    s1: String;
    o1: Int?;
    nested1: Complex2;
}

struct Complex2 {
    s2: String;
    b2: Bool;
    optNested: Complex3?;
}

struct Complex3 {
    x: Int;
    y: String?;
    z: Bool;
}

contract ComplexFields {
    data: Complex1;

    init() {
        self.data = Complex1{
            i1:10,
            s1:"hi",
            o1:null,
            nested1: Complex2{
                s2:"hey",
                b2:true,
                optNested: Complex3{
                    x:5,
                    y:null,
                    z:false,
                }
            }
        };
    }
}