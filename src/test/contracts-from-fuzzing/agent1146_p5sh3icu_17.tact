struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
}

contract ComplexTest {
    val: Complex;

    init() {
        self.val = Complex{
            a:1, b:true, c:null, d:null, e:2, f:false, g:3, h:true
        };
    }
}