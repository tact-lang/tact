struct Complex {
    v1: Int;
    v2: Bool?;
    nest: Nested;
}

struct Nested {
    s: String;
    bx: Bool;
}

contract ComplexStructField {
    cs: Complex;

    init() {
        self.cs = Complex{
            v1:10,
            v2:true,
            nest: Nested{ s:"ok", bx:false }
        };
    }
}
