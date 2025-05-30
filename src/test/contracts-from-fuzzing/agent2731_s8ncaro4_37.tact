struct Complex {
    a: Int;
    b: Int?;
    c: String;
    d: Bool?;
    e: String?;
}

contract ManyOptsMixed {
    data: Complex;

    init() {
        self.data = Complex{
            a:1, b:null, c:"c", d:null, e:null
        };
    }
}