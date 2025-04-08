struct Complex {
    x: Int;
    y: Bool?;
    s: String;
    n: Nested;
}

struct Nested {
    a: Int?;
    b: Bool;
}

contract ComplexTest {
    f: Complex;

    init() {
        self.f = Complex{
            x:5,
            y:true,
            s:"hi",
            n:Nested{ a:null, b:false }
        };
    }
}